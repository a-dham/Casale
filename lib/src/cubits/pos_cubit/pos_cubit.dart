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
  Map? paymethodsMap;
  getLinkedBranchData() async {
    try {
      branchModel = await BranchRepository().getLinkedBranchData();
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
    }
  }

  // collect Order Data
  Map<String, dynamic> orderData = {};
  newOrder() async {
    paymethodsMap = {
      for (var paymethod in paymethods)
        // ignore: unnecessary_string_interpolations
        "${paymethod.paymethodId.toString()}": paymethod.value
    };
    emit(InvoiceDataStateLoading());
    // First  Send pos Data to add order.
    await DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {
        "add_pos_order_submit": 1,
        "_status": "added",
        "order_status": "added",
        "from_id": branchModel?.data?.branchId,
        "to_id": customerId,
        "paymethods": paymethodsMap,
        "order_items": cart.map((item) => item.toJson()).toList(),
        "total_items_price": toFixed(totalorder),
        "total_items_taxval": toFixed(totalVat),
        "total_items_withtaxval": toFixed(totalorderWithVat),
        "remaining": remaining
      },
      // "total_items_discount": 0,
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

    // Add Order Data to Map to print
    if (invoiceModel?.status == 'success') {
      orderData = {
        'logo': '${EndPoints.assetsUrl}${orgData?.data?.logo}',
        'orgTitle': orgData?.data?.arabicTitle,
        'orgVatRegistrationNumber': orgData?.data?.vatNumber,
        'phone': orgData?.data?.phone,
        'barnchId': branchModel?.data?.branchId ?? '',
        'branchTitel': branchModel?.data?.branchName ?? '',
        'branchAddress': invoiceModel?.callBack?.order?.branchAddress ?? '',
        'accountId': loginModel?.data?.userId,
        'accountTitle': loginModel?.data?.accountTitle,
        'orderNumber': invoiceModel?.callBack?.order?.inoivceNumber ?? '',
        'customerId': customerId,
        'customerName': invoiceModel?.callBack?.order?.cutomerName,
        'customerVatRegistrationNumber':
            invoiceModel?.callBack?.order?.customerVatNumber,
        'customerAddress': invoiceModel?.callBack?.order?.cutomerAddress,
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
    } else {}
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
      // ignore: avoid_print
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
      cart[existingIndex].quantity++;
      itemTotalWithVat(cart[existingIndex], item);
    } else {
      cart.add(item);
      itemTotalWithVat(item, item);
    }
    emit(PosStateItemToCart());
  }

  void decresQuantityFromCart(item) {
    int existingIndex =
        cart.indexWhere((cartItem) => cartItem.itemId == item.itemId);
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
    index.totalPrice = double.parse(item.units[item.selectedUnit].unitPrice);
    index.vat =
        (index.totalPrice * (1 + (index.itemTaxes / 100))) - index.totalPrice;
    index.totalPriceWithVat = (index.totalPrice + index.vat) * item.quantity;

    // (double.parse(item.units[item.selectedUnit].unitPrice) *
    //         item.quantity) *
    //     (1 + (item.tax / 100));
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
      totalorderWithVat += item.totalPriceWithVat;

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
      }
    }).catchError((error) {});
  }

  getCustomer(customer) {
    // customer = CustomersModel.fromJson2(customer);
    // customerName = customersModel?.customer?.firstName;
    customer = customer;
    customerName = customer.firstName;
    customerId = customer.customerId;
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
      validateModel = ValidateModel.fromjson(value?.data);
      if (validateModel?.status == "success") {
        emit(AddCustomerStateSuccess());
        return validateModel?.status;
      } else if (validateModel?.status == null) {
        emit(AddCustomerStateFail());
      }
    }).catchError((error) {
      return error;
    });
  }

  List? filterCusotmers = [];
  bool isSearchCustomer = false;
//  filter customers
  filterCustomer(input) {
    isSearchCustomer = true;
    emit(CustomerSearchStateloading());

    filterCusotmers = customers!
        .where((customer) => customer.customerKey.contains(input))
        .toList();
    emit(CustomerSearchStateSuccess());
  }

  // isFilterCustomer() {
  //   isSearchCustomer = !isSearchCustomer;
  //   emit(CustoerIsSearchStateSuccess());
  // }

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
      filterdItems =
          items!.where((item) => item.itemKey.contains(input)).toList();
    }
    emit(ItemSearchStateSuccess());
  }

  // filter item with section id
  // var itemsSection;
  filterItemsSection(sectionId) {
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
      requiredToPaid = requiredToPaid + paymethod.value;

      paymethod.value = payed;
      requiredToPaid = requiredToPaid - paymethod.value;
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

  // List? dd = paymethodModel?.data;
  // selectedPaymethods({required payed, required paymethod}) {
  //   print(paymethod);
  //   print(payed);
  //   paymethodModel?.data?[0].value = paymethod.value;
  //   print(paymethods?[0].title);
  //   remainingPayment(paymethods: paymethods);
  // }

  // remainingPayment({paymethods}) {
  //   // print(paymethod.toString());
  //   var payed;
  //   for (var paymethod in paymethods) {
  //     payed += paymethod.value;
  //   }
  //   payed.toString();
  //   requiredToPaid = totalorderWithVat;
  //   remaining = requiredToPaid - payed;

  //   remaining < 0 ? remaining = remaining * -1 : null;

  //   // paymethod.value = payed;
  //   // paymethods?.add(paymethod);
  //   // requiredToPaid = requiredToPaid - paymethod.value;
  //   // if (requiredToPaid < 0) {
  //   //   remaining = -1 * requiredToPaid;
  //   //   requiredToPaid = 0.00;
  //   // } else {
  //   //   remaining = 0.00;
  //   // }
  //   print(paymethods);
  //   emit(RemainingstateSuccess());
  // }
}
