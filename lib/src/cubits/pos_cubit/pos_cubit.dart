import 'package:bloc/bloc.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
        id: 4, title: 'ssss', price: 4, description: 'sssss', quantity: 1),
  ];
  // cart
  List<ItemsModel> cart = [];
  //add item to cart
  void addItemTocart(ItemsModel item) {
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingIndex != -1) {
      cart[existingIndex].quantity++;
    } else {
      cart.add(item);
    }
    emit(PosStateItemToCart());
  }

  void removeItemFromCart(ItemsModel item) {
    print('remove start $cart');
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    cart[existingIndex].quantity == 0;
    cart.remove(item);
    emit(PosStateRemoveItem());
    print('remove end $cart');
  }

  void decresQuantityFromCart(ItemsModel item) {
    int existingIndex = cart.indexWhere((cartItem) => cartItem.id == item.id);
    if (existingIndex != -1) {
      if (cart[existingIndex].quantity > 1) {
        cart[existingIndex].quantity--;
      } else {
        cart.removeAt(item.id);
      }
    }
    emit(PosStateRemoveItem());
  }

  void clearCart() {
    cart.clear();
    emit(PosStateClearCart());
  }
}
