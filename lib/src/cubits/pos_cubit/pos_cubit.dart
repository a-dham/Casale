// ignore_for_file: avoid_print

import 'package:casale/src/cubits/pos_cubit/local_items.dart';
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/data/repository/item_section_repository.dart';
import 'package:casale/src/data/repository/items_repository.dart';
import 'package:casale/src/domain/models/customer_model.dart';
import 'package:casale/src/domain/models/item_sections_model.dart';
import 'package:casale/src/domain/models/login_model.dart';
import 'package:casale/src/domain/models/org_model.dart';
import 'package:casale/src/domain/models/paymethods_model.dart';
import 'package:casale/src/domain/models/validate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  PosCubit() : super(PosInitial());
  static PosCubit get(context) => BlocProvider.of(context);

  String sysAc = CacheHelper.getData(key: 'sysac');
  final ItemSectionsRepository sectionsRepository = ItemSectionsRepository();
  List? items = [];
  ItemSectionsModel? itemSections;
  List? sections = [];
  List cart = [];
  List units = [];
  double totalorderWithVat = 0;
  double requiredToPaid = 0;
  double remaining = 0;

//  get Items sections
  getItemSections() {
    emit(ItemsSectionsStateLoading());
    sectionsRepository.getItemSections().then((sections) {
      emit(ItemsSectionsStateSuccess());
      this.sections = sections.data;
    });
    return sections;
  }

// get all items
  getItems() async {
    emit(ItemsStateLoading());
    await ItemsRepository().getItems().then((items) {
      this.items = items?.dataList;
    });
    emit(GetItemsSuccess());
    return items;
  }

  // cart
  //add item to cart
  void addItemTocart(item) {
    int existingIndex =
        cart.indexWhere((cartItem) => cartItem.itemId == item.itemId);
    if (existingIndex > -1) {
      print(existingIndex);
      cart[existingIndex].quantity++;
      itemTotalWithVat(cart[existingIndex], item);
    } else {
      print(existingIndex);
      cart.add(item);
      itemTotalWithVat(item, item);
    }
    emit(PosStateItemToCart());
  }

  addOrderData(item) {
    order['order_items'].add(item);
    print(order['order_items']);
    for (var element in order['order_items']) {
      print(element.arabicTitle);
    }
  }

  void decresQuantityFromCart(item) {
    int existingIndex =
        cart.indexWhere((cartItem) => cartItem.itemId == item.itemId);
    print(existingIndex);
    if (existingIndex > -1) {
      cart[existingIndex].quantity--;
      itemTotalWithVat(cart[existingIndex], item);
    } else if (cart[existingIndex].quantity == 0) {
      removeItemFromCart(item);
    }
    emit(PosStateRemoveItem());
  }

  void removeItemFromCart(item) {
    cart.removeWhere((element) => element == item);
    item.quantity = 1;
    invoiceTotal();
    emit(PosStateRemoveItem());
  }

  void clearCart() {
    cart.clear();
    emit(PosStateClearCart());
  }

  //calculate item Total With vat
  itemTotalWithVat(index, item) {
    index.totalPriceWithVat =
        (double.parse(item.units[item.selectedUnit].unitPrice) *
                item.quantity) *
            (1 + (item.tax / 100));
    invoiceTotal();
    emit(PriceItemStateSuccess());
  }

  // calculate total order
  void invoiceTotal() {
    totalorderWithVat = 0;
    for (var item in cart) {
      print('total item ${item.totalPriceWithVat}');
      totalorderWithVat += item.totalPriceWithVat;
    }
    requiredToPaid = totalorderWithVat;
    emit(TotalOrderStateSuccess());
  }

  // get customers
  CustomersModel? customersModel;
  List customers = [];

  getCustomers() async {
    await DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
      'flr': 'casale/manage/customers/views',
      'rtype': 'json',
      'sysac': sysAc,
    }).then((value) {
      customersModel = CustomersModel.fromJson(value!.data);
      if (customersModel!.status == 'success') {
        for (var element in customersModel!.customers) {
          customers.add(element);
        }
      } else {
        //        showToastMessage("No Customer Found");
        print('no customer found');
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  String? customerName;
  getCustomer(String customerId) {
    DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {},
      queryParameters: {
        "flr": "casale/manage/customers/view",
        "rtype": "json",
        "dtype": "json",
        "customer_id": customerId,
        "sysac": sysAc
      },
    ).then((value) {
      customersModel = CustomersModel.fromJson2(value?.data);
      customerName = customersModel?.customer?.firstName;
      emit(GetCustomerState());
    });
  }

// add customer
  ValidateModel? validateModel;
  addCustomer({
    required String firstName,
    required String email,
    required String phoneNumber,
  }) async {
    emit(AddCustomerStateLoading());
    await DioHelper.postData(url: EndPoints.baseUrl, data: {
      "add_customer_submit": "1",
      "first_name": firstName,
      "email": email,
      "phone_no": phoneNumber
    }, queryParameters: {
      "flr": "casale/manage/customers/add",
      "dtype": "json",
      "rtype": "json",
      "sysac": sysAc
    }).then((value) {
      validateModel = ValidateModel.fromjson(value?.data);
      if (validateModel?.status == "success") {
        print(validateModel?.cusotmerId);
        print(validateModel?.status);
        emit(AddCustomerStateSuccess());
        return validateModel?.status;
      } else if (validateModel?.status == null) {
        emit(AddCustomerStateFail());
        print('customer fail ${value?.data}');
      }
    }).catchError((error) {
      print('catch error====== ${error.toString()}');
      return error;
    });
  }

  // get org data
  OrgModel? orgModel;
  getOrgData() async {
    emit(GetAccountStateLoading());
    await DioHelper.postData(
        url: EndPoints.baseUrl,
        data: {},
        queryParameters: {
          "flr": "acc/org",
          "dtype": "json",
          "rtype": "json",
          "sysac": sysAc
        }).then((value) {
      orgModel = OrgModel.fromJson(value?.data);
      emit(GetOrgStateSuccess(
        orgModel: orgModel,
      ));
      return orgModel;
    });
  }

  LoginModel? loginModel;
  getAccountData() async {
    emit(GetAccountStateLoading());
    emit(PosInitial());
    await DioHelper.postData(
        url: EndPoints.baseUrl,
        data: {},
        queryParameters: {
          'flr': 'acc/login',
          'sysac': sysAc,
          'rtype': 'json',
        }).then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      emit(GetAccountStateSuccess());
    });
  }

//  fun for filter items
  List? filterdItems = [];
  bool isSearched = false;
  filterItems(dynamic input) {
    emit(ItemSearchStateloading());

    if (items != null && items!.isNotEmpty) {
      print(items);
      print('con start');
      filterdItems = items!
          .where(
            (item) => item.itemKey.contains(input),
          )
          .toList();
    }
    print(filterdItems);
    emit(ItemSearchStateSuccess());
  }

  // filter item with section id
  // var itemsSection;
  filterItemsSection(sectionId) {
    print(sectionId);
    // for (var item in items!) {
    //   if (item.sectionId == sectionId) {
    //     print('there is section id ');
    //     itemsSection.add(item);
    //   }
    // }
    // // itemsSection = items!.where((item) => item.sectionId == sectionId).toList();
    // print(itemsSection);
    // emit(ItemsSectionStateSuccess());
  }

  // select unit and calculate total or item
  changeUnit(item, int value) {
    item.selectedUnit = value - 1;
    itemTotalWithVat(item, item);
    emit(UnitSelectStateSuccess());
  }

  // get paymethods
  PaymethodModel? paymethodModel;
  getPaymethods() async {
    emit(PaymethodsstateInitial());
    await DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {},
      queryParameters: {
        'flr': 'casale/manage/settings/inputoptions/paymethods/views',
        'sysac': sysAc,
        'rtype': 'json',
        'dtype': 'json',
      },
    ).then((value) {
      paymethodModel = PaymethodModel.fromJson(value?.data);
      emit(GetPaymethodsstateSuccess(
        paymethodModel: paymethodModel,
      ));
    }).catchError((error) {
      print('error is== $error');
    });
  }

  // calculate Remaining of payment
  remainingPayment(
    totalOrder,
    payed,
  ) {
    print('start');
    requiredToPaid = totalOrder;
    requiredToPaid = totalOrder - payed;
    if (requiredToPaid < 0) {
      remaining = -1 * requiredToPaid;
      requiredToPaid = 0.00;
    } else {
      remaining = 0;
    }

    print(remaining.toString());
    emit(RemainingstateSuccess());
  }
}
