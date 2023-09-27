// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/customer_model.dart';
import 'package:casale/src/domain/models/login_model.dart';
import 'package:casale/src/domain/models/org_model.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  PosCubit() : super(PosInitial());
  static PosCubit get(context) => BlocProvider.of(context);
  String sysAc = CacheHelper.getData(key: 'sysac');

  // items

  ItemModel? itemModel;
  List? items = [];
  getItems() {
    emit(PosInitial());
    DioHelper.postData(url: EndPoints.baseUrl, data: {
      'flr': sysAc,
    }, queryParameters: {
      'flr': 'casale/manage/items/views',
      'sysac': sysAc,
      'rtype': 'json',
      'dtype': 'json',
    }).then((value) {
      itemModel = ItemModel.fromJson(value?.data);
      items = itemModel?.dataList;
      emit(GetItemsSuccess(itemModel: itemModel));
    }).catchError((error) {
      print('error is = $error');
    });
  }

  // cart
  List cart = [];
  double totalPrice = 0;
  double remainingToPay = 0.00;

  String dropdownValue = '';
  List<String> units = [];

  //add item to cart
  void addItemTocart(item) {
    // print(item.itemId);
    // int existingIndex =
    //     cart.indexWhere((cartItem) => cartItem.itemId == item.itemId);
    // if (cart.contains(item)) {
    //   var quantity = cart[existingIndex].cartItem.units['1'].unitQuantity++;
    //   print(quantity);
    // } else {
    //   cart.add(item);
    // }

    cart.add(item);
    dropdownValue = item.units[0].title;
    for (var element in item.units) {
      units.add(element.title);
      print(element.title);
    }
    invoiceTotal();
    emit(PosStateItemToCart());
  }

  // void decresQuantityFromCart(ItemsModel item) {
  //   // int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
  //   if (cart.contains(item)) {
  //     // if (cart[existingIndex].quantity > 1) {
  //       // cart[existingIndex].quantity--;
  //     } else {
  //       // cart[existingIndex].quantity = 1;
  //       cart.removeWhere((element) => element == item);
  //     }
  //     invoiceTotal();
  //   }
  //   // emit(PosStateRemoveItem());
  // }

  void removeItemFromCart(item) {
    // int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    // cart[existingIndex].quantity = 1;
    cart.removeWhere((element) => element == item);
    invoiceTotal();
    emit(PosStateRemoveItem());
  }

  void clearCart() {
    cart.clear();
    emit(PosStateClearCart());
  }

  // calculate total invoice
  void invoiceTotal() {
    totalPrice = 0;
    for (var item in cart) {
      totalPrice += double.parse(item.units[0].unitPrice);
    }
    remainingToPay = totalPrice;
    print('final  total $totalPrice');
  }

  // get customers
  CustomersModel? customersModel;
  List customers = [];

  getCustomers() async {
    // String sysacc = CacheHelper.getData(key: 'sysacc');
    await DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
      'flr': 'casale/manage/customers/views',
      'rtype': 'json',
      'sysac': 'YXpjamJkZWNiMXh6NzQ2bXo3NDJ6ejc0cWMyMHRtMjBmbjM0d3YyMA',
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
      if (value != null) {
        emit(AddCustomerStateSuccess());
        print(value.data);
      } else {
        print('customer fail $value');
      }
    }).catchError((error) {
      print('catch error ${error.toString()}');
    });
  }

  // get org data
  OrgModel? orgModel;
  getOrgData() {
    DioHelper.postData(url: EndPoints.baseUrl, data: {}, queryParameters: {
      "flr": "acc/org",
      "dtype": "json",
      "rtype": "json",
      "sysac": sysAc
    }).then((value) {
      emit(GetAccountStateLoading());
      orgModel = OrgModel.fromJson(value?.data);
      emit(GetOrgStateSuccess(
        orgModel: orgModel,
      ));
    });
  }

  LoginModel? loginModel;
  getAccountData() {
    DioHelper.postData(url: EndPoints.baseUrl, data: {}, queryParameters: {
      'flr': 'acc/login',
      'sysac': sysAc,
      'rtype': 'json',
    }).then((value) {
      emit(GetAccountStateLoading());
      loginModel = LoginModel.fromJson(value?.data);
      emit(GetAccountStateSuccess());
    });
  }

//  fun for filter items

  List? filterdItems = [];
  bool isSearched = false;
  filterItems(dynamic input) {
    emit(ItemSearchStateloading());
    print('start');
    if (isSearched == true && items != null && items!.isNotEmpty) {
      print('second');
      filterdItems = items!
          .where(
            (item) => item.arabicTitle.contains(input),
          )
          .toList();
      print('third');
      for (var element in filterdItems!) {
        print(element.arabicTitle);
      }
      return filterdItems;
    }
    emit(ItemSearchStateSuccess());
  }

  // select unit and calculate total or item
  selectUnit(selectedValue) {
    dropdownValue = selectedValue;
    emit(UnitSelectStateSuccess());
  }
}
