// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/data/repository/account_data_repository.dart';
import 'package:casale/src/data/repository/branch_repository.dart';
import 'package:casale/src/data/repository/item_section_repository.dart';
import 'package:casale/src/data/repository/items_repository.dart';
import 'package:casale/src/data/repository/org_data_repository.dart';
import 'package:casale/src/data/repository/paymethods_repository.dart';
import 'package:casale/src/domain/models/branch_model.dart';
import 'package:casale/src/domain/models/customer_model.dart';
import 'package:casale/src/domain/models/invoice_model.dart';
import 'package:casale/src/domain/models/item_sections_model.dart';
import 'package:casale/src/domain/models/login_model.dart';
import 'package:casale/src/domain/models/org_model.dart';
import 'package:casale/src/domain/models/paymethods_model.dart';
import 'package:casale/src/domain/models/validate_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:casale/src/utils/constant/tofixed.dart';
import 'package:intl/intl.dart';

import '../../data/datasources/local/cashe_helper.dart';
part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  PosCubit() : super(PosInitial());
  static PosCubit get(context) => BlocProvider.of(context);
  // Switch(
  //             value: darkMode,
  //             onChanged: (val) {
  //               box.put('darkMode', !darkMode);
  //             },
  // ),

  String sysAc = CacheHelper.getData(key: 'sysac');
  // String sysAc =
  //     'em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU';
  final ItemSectionsRepository sectionsRepository = ItemSectionsRepository();
  List? items = [];
  ItemSectionsModel? itemSections;
  List? sections = [];
  List cart = [];
  List units = [];
  List paymethods = [];
  double totalorderWithVat = 0;
  double totalorder = 0;
  double totalVat = 0;
  double requiredToPaid = 0;
  double remaining = 0;
  BranchModel? branchModel;
  InvoiceModel? invoiceModel;
  Customer? customer;
  String? customerName;
  String? customerId;

  getLinkedBranchData() async {
    try {
      branchModel = await BranchRepository().getLinkedBranchData();
    } catch (error) {
      print('error from pos cubit $error');
    }
  }

  // collect Order Data
  Map<String, dynamic> orderData = {};
  newOrder() async {
    emit(InvoiceDataStateLoading());
    print(customer);
    print(customerName);
    print(customerId);
    // First  Send pos Data to add order.
    await DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {
        "add_pos_order_submit": 1,
        "_status": "added",
        "order_status": "added",
        "from_id": branchModel?.data?.branchId,
        "to_id": customerId,
        "paymethods": paymethods
            .map((paymethod) => paymethod.toJson())
            .toList()
            .toString(),
        "order_items": cart.map((item) => item.toJson()).toList(),
        "total_items_price": toFixed(totalorder),
        "total_items_discount": 0,
        "total_items_taxval": toFixed(totalVat),
        "total_items_withtaxval": toFixed(totalorderWithVat),
        "remaining": remaining
      },
      queryParameters: {
        "flr": "casale/manage/sales/invoices/add",
        "rtype": "json",
        "dtype": "json",
        "sysac": sysAc,
      },
    ).then((value) {
      invoiceModel = InvoiceModel.fromJson(value?.data);
      emit(InvoiceDataStateSuccess());
      // check if order is successed added
    });
    print('----------------------------------');

    // Add Order Data to Map to print
    if (invoiceModel?.status == 'success') {
      orderData = {
        'logo': '${EndPoints.assetsUrl}${orgData?.data?.logo}',
        'orgTitle': orgData?.data?.arabicTitle,
        'orgvatRegistrationNumber': orgData?.data?.vatNumber,
        'phone': orgData?.data?.phone,
        'barnchId': branchModel?.data?.branchId ?? '',
        'branchTitel': branchModel?.data?.branchName ?? '',
        'branchAddress': invoiceModel?.callBack?.order?.branchAddress ?? '',
        'accountId': loginModel?.data?.userId,
        'accountTitle': loginModel?.data?.accountTitle,
        'orderNumber': invoiceModel?.callBack?.order?.inoivceNumber ?? '',
        'customerId': customerId,
        'customerName': invoiceModel?.callBack?.order?.cutomerName,
        'customerVatRegistrationNumber': customer?.vatNumber,
        'customerAddress': customer?.address,
        'customerPhone': customer?.phoneNo,
        'customerRemaining': remaining,
        'totalOrder': toFixed(totalorder),
        'totalVat': toFixed(totalVat),
        'totalOrderWithVat': toFixed(totalorderWithVat),
        'selectedPaymethods': paymethods,
        'cart': cart,
        'addOrdertime': invoiceModel?.callBack?.order?.orderDateTime ??
            DateFormat('dd-MM-yyyy HH:mm', 'en').format(DateTime.now()),
        // 'notes': 'Notessssssssssssssss',
      };
    } else {
      print('add order is faile');
    }
    print(orderData);
  }

//  get Items sections
  getItemSections() {
    emit(ItemsSectionsStateLoading());
    try {
      sectionsRepository.getItemSections().then((sections) {
        emit(ItemsSectionsStateSuccess());
        this.sections = sections.data;
      });
    } catch (error) {
      print(error.toString());
    }

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
    item.selectedUnit = 0;
    invoiceTotal();
    emit(PosStateRemoveItem());
  }

  void clearCart() {
    for (var item in cart) {
      item.quantity = 1;
    }
    cart.clear();
    invoiceTotal();
    emit(PosStateClearCart());
  }

  //calculate item Total With vat
  itemTotalWithVat(index, item) {
    index.totalPriceWithVat =
        (double.parse(item.units[item.selectedUnit].unitPrice) *
                item.quantity) *
            (1 + (item.tax / 100));
    index.totalPrice = double.parse(item.units[item.selectedUnit].unitPrice);
    invoiceTotal();
    emit(PriceItemStateSuccess());
  }

  // itemTotalWithVat(index, item) {
  //   index.totalPriceWithVat =
  //       (double.parse(item.units[item.selectedUnit].unitPrice) *
  //               item.quantity) *
  //           (1 + (item.tax / 100));
  //   index.totalPrice = double.parse(item.price);
  //   invoiceTotal();
  //   emit(PriceItemStateSuccess());
  // }

  // calculate total order
  void invoiceTotal() {
    totalorderWithVat = 0;
    totalVat = 0;
    totalorder = 0;
    for (var item in cart) {
      print('total item ${item.totalPriceWithVat}');
      totalorderWithVat += item.totalPriceWithVat;

      print('total item vat ${item.vat}');
      print(
        '-----------------------------------------------------------------------------',
      );

      totalVat += (item.vat * item.quantity);
    }

    requiredToPaid = totalorderWithVat;
    totalorder = totalorderWithVat - totalVat;
    emit(TotalOrderStateSuccess());
  }

  // get customers
  CustomersModel? customersModel;
  List? customers = [];

  getCustomers() async {
    await DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
      'flr': 'casale/manage/customers/views',
      'rtype': 'json',
      'sysac': sysAc,
    }).then((value) {
      customersModel = CustomersModel.fromJson(value!.data);
      if (customersModel!.status == 'success') {
        for (var element in customersModel!.customers) {
          customers?.add(element);
        }
      } else {
        //        showToastMessage("No Customer Found");
        print('no customer found');
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  getCustomer(customer) {
    // customer = CustomersModel.fromJson2(customer);
    // customerName = customersModel?.customer?.firstName;
    customer = customer;
    customerName = customer.firstName;
    customerId = customer.customerId;
    print(customer);
    emit(GetCustomerState());
  }

// add customer
  ValidateModel? validateModel;
  addCustomer({
    required String firstName,
    required String familyName,
    required String email,
    required String phoneNumber,
  }) async {
    emit(AddCustomerStateLoading());
    await DioHelper.postData(url: EndPoints.baseUrl, data: {
      "add_customer_submit": "1",
      "first_name": firstName,
      "family_name": familyName,
      "email": email,
      "phone_no": phoneNumber
    }, queryParameters: {
      "flr": "casale/manage/customers/add",
      "dtype": "json",
      "rtype": "json",
      "sysac": sysAc
    }).then((value) {
      print(value?.data);
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

  List? filterCusotmers = [];
  bool isSearchCustomer = false;
//  filter customers
  filterCustomer(input) {
    print('first is search $isSearchCustomer');
    isSearchCustomer = true;
    emit(CustomerSearchStateloading());
    print('second  is search after loading $isSearchCustomer');

    filterCusotmers = customers!
        .where((customer) => customer.customerKey.contains(input))
        .toList();
    print('filter customer ---------------- $filterCusotmers');
    emit(CustomerSearchStateSuccess());
  }

  isFilterCustomer() {
    isSearchCustomer = !isSearchCustomer;
    emit(CustoerIsSearchStateSuccess());
  }

// get org data
  OrgModel? orgData;
  getOrgData() async {
    emit(GetOrgDataStateLoading());
    orgData = await OrgDataRepository().getOrgData();
    emit(GetOrgDataStateSuccess());
  }

  LoginModel? loginModel;
  getAccountData() async {
    emit(GetAccountStateLoading());
    loginModel = await AccountDataRepostory().getAccountData();
    emit(GetAccountStateSuccess());
  }

//  fun for filter items
  List? filterdItems = [];
  bool isSearched = false;
  filterItems(dynamic input) {
    isSearched = true;
    emit(ItemSearchStateloading());
    if (isSearched == true && items != null && items!.isNotEmpty) {
      print(items);
      print('con start');
      filterdItems =
          items!.where((item) => item.itemKey.contains(input)).toList();
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
  changeUnit(item, value) {
    print('from pos cubit ${value - item.units[0].unitId}');
    item.selectedUnit = value - item.units[0].unitId;
    itemTotalWithVat(item, item);
    emit(UnitSelectStateSuccess());
  }

  // get paymethods
  PaymethodModel? paymethodModel;
  getPaymethods() async {
    emit(PaymethodsstateInitial());
    paymethodModel = await PaymethodsRepository().getPayMethods();
    emit(GetPaymethodsstateSuccess());
  }

  // calculate Remaining of payment
  remainingPayment({payed, paymethod}) {
    if (paymethods.contains(paymethod)) {
      print('payed $payed');
      print('req to paid before add old value    $requiredToPaid');
      requiredToPaid = requiredToPaid + paymethod.value;
      print('req to paid after add old value    $requiredToPaid');
      paymethod.value = payed;
      requiredToPaid = requiredToPaid - paymethod.value;
      print('req to paid after --- old value    $requiredToPaid');

      print(payed);
      if (requiredToPaid < 0) {
        remaining = -1 * requiredToPaid;
        requiredToPaid = 0.00;
      } else {
        remaining = 0.00;
      }
    } else {
      paymethod.value = payed;
      paymethods.add(paymethod);
      requiredToPaid = requiredToPaid - paymethod.value;
      if (requiredToPaid < 0) {
        remaining = -1 * requiredToPaid;
        requiredToPaid = 0.00;
      } else {
        remaining = 0.00;
      }
    }
    emit(RemainingstateSuccess());
  }
}
