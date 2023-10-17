import 'package:casale/src/data/services/order_services.dart';
import 'package:casale/src/domain/models/order_model.dart';

class OrderRepository {
  Future<OrderModel?> getOrders() async {
    try {
      Map<String, dynamic> ordersServices = await OrderServices().getOrders();
      return OrderModel.fromJson(ordersServices);
    } catch (error) {
      print('error from repo is =============$error');
      return null;
    }
  }
}
