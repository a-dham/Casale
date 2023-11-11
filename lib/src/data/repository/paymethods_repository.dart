import 'package:casale/src/data/services/paymethods_services.dart';
import 'package:casale/src/domain/models/paymethods_model.dart';

class PaymethodsRepository {
  Future<PaymethodModel?> getPayMethods() async {
    Map<String, dynamic> paymethods =
        await PaymethodsServices().getPaymethods();
    return PaymethodModel.fromJson(paymethods);
  }
}
