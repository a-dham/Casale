import 'package:dio/dio.dart';

import '../datasources/end_points.dart';
import '../datasources/local/cashe_helper.dart';
import '../datasources/remote/dio_helper.dart';

class PaymethodsServices {
  String sysAc = CacheHelper.getData(key: 'sysac');

  Future<Map<String, dynamic>> getPaymethods() async {
    Response? response = await DioHelper.postData(
      url: EndPoints.baseUrl,
      data: {},
      queryParameters: {
        'flr': 'casale/manage/settings/inputoptions/paymethods/views',
        'sysac': sysAc,
        'rtype': 'json',
        'dtype': 'json',
      },
    );
    return response?.data;
  }
}
