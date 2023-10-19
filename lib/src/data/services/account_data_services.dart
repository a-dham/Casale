import 'package:dio/dio.dart';

import '../datasources/end_points.dart';
import '../datasources/local/cashe_helper.dart';
import '../datasources/remote/dio_helper.dart';

class AccountDataServices {
  String sysAc = CacheHelper.getData(key: 'sysac');
  Future<Map<String, dynamic>> getAccountData() async {
    try {
      Response? response = await DioHelper.postData(
          url: EndPoints.baseUrl,
          data: {},
          queryParameters: {
            'flr': 'acc/login',
            'sysac': sysAc,
            'rtype': 'json',
          });
      return response?.data;
    } catch (error) {
      print('error from account services ${error.toString()}');
      return {};
    }
  }
}
