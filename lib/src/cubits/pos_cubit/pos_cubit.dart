// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/domain/models/customer_model.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pos_state.dart';

class PosCubit extends Cubit<PosState> {
  PosCubit() : super(PosInitial());
  static PosCubit get(context) => BlocProvider.of(context);
  // items
  List<ItemsModel> items = [
    ItemsModel(
        id: 1, title: 'cofee', price: 51, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 2, title: 'milk', price: 20, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 3, title: 'bread', price: 3, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 5, title: 'ssss', price: 4, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 6, title: 'ssss', price: 4, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 7, title: 'ssss', price: 4, description: 'sssss', quantity: 1),
    ItemsModel(
        id: 8, title: 'ssss', price: 4, description: 'sssss', quantity: 1),
  ];
  // cart
  List<ItemsModel> cart = [];
  double totalPrice = 0;

  //add item to cart
  void addItemTocart(ItemsModel item) {
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    if (cart.contains(item)) {
      var quantity = cart[existingIndex].quantity++;
      print(quantity);
    } else {
      cart.add(item);
    }
    invoiceTotal();
    emit(PosStateItemToCart());
  }

  void decresQuantityFromCart(ItemsModel item) {
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    if (cart.contains(item)) {
      if (cart[existingIndex].quantity > 1) {
        cart[existingIndex].quantity--;
      } else {
        cart[existingIndex].quantity = 1;
        cart.removeWhere((element) => element == item);
      }
      invoiceTotal();
    }
    emit(PosStateRemoveItem());
  }

  void removeItemFromCart(ItemsModel item) {
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    cart[existingIndex].quantity = 1;
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
      totalPrice += (item.price * item.quantity);
      print('total $totalPrice');
    }
    print('final  total $totalPrice');
  }

  // get customers
  CustomersModel? customerModel;
  List customers = [];

  getCustomers() async {
    // String sysacc = CacheHelper.getData(key: 'sysacc');
    await DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
      'flr': 'casale/manage/customers/views',
      'rtype': 'json',
      'sysac': 'YXpjamJkZWNiMXh6NzQ2bXo3NDJ6ejc0cWMyMHRtMjBmbjM0d3YyMA',
    }).then((value) {
      customerModel = CustomersModel.fromJson(value!.data);
      if (customerModel!.status == 'success') {
        for (var element in customerModel!.customers) {
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

  getCustomer(String customerId) {
    print('customer id ${customerId.toString()}');
  }

// add customer
  String sysAc = CacheHelper.getData(key: 'sysac');
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
        print('customer add');
        print(value.data);
      } else {
        print('customer fail');
      }
    }).catchError((error) {
      print('catch error ${error.toString()}');
    });
  }

// "sysac":"bmZjZWNkaG1iMGJ6NzQxdno3NDF4ejc0Zm4yMHNiMjBwYTM0Zm4yMA"
// acc/org&sysac&rtype=json&
  getOrgData() {
    DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
      "flr": "acc/org",
      "dtype": "json",
      "rtype": "json",
      "sysac": sysAc
    }).then((value) {
      print(value?.data);
    });
  }
}
