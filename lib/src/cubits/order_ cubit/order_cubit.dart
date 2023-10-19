import 'package:casale/src/data/repository/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  static OrderCubit get(context) => BlocProvider.of(context);

  bool? isLoading = false;
  // get all orders of this
  List? orders = [];
  Future<List?> getOrders() async {
    emit(OrderInitial());
    isLoading = true;
    await OrderRepository().getOrders().then((orders) {
      this.orders = orders?.data;
    });
    emit(OrderGetDataSuccess());
    return orders;
  }
}
