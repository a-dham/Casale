import 'package:casale/src/data/services/account_data_services.dart';
import 'package:casale/src/domain/models/login_model.dart';

class AccountDataRepostory {
  Future<LoginModel?> getAccountData() async {
    try {
      Map<String, dynamic> accountServices =
          await AccountDataServices().getAccountData();
      return LoginModel.fromJson(accountServices);
    } catch (error) {
      // ignore: avoid_print
      print('error from account repo ${error.toString()}');
      return null;
    }
  }
}
