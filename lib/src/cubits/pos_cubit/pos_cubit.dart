import 'dart:convert';

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
  var item;
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
      // print(value?.data);
      item = ItemModel.fromJson(value?.data);

      print('itemssssssssssssss--- ${item.status}');
      print('itemssssssssssssss--- ${item.data[10]?.englishTitle}');
      print('itemssssssssssssss--- ${item.data[35]?.price}');
      emit(GetItemsSuccess(itemModel: itemModel));
    });
  }

  // cart
  List<ItemModel> cart = [];
  double totalPrice = 0;

  //add item to cart
  // void addItemTocart(ItemModel item) {
  //   // int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
  //   if (cart.contains(item)) {
  //     // cart[existingIndex].quantity++;
  //   } else {
  //     cart.add(item);
  //   }
  //   invoiceTotal();
  //   emit(PosStateItemToCart());
  // }

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
    // cart.removeWhere((element) => element == item);
    invoiceTotal();
    // emit(PosStateRemoveItem());
  }

  void clearCart() {
    // cart.clear();
    // emit(PosStateClearCart());
  }

  // calculate total invoice
  void invoiceTotal() {
    // totalPrice = 0;
    // for (var item in cart) {
    // totalPrice += (item.price * item.quantity);
    // }
    // print('final  total $totalPrice');
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

// get paymethods

  // getPaymethods
}
