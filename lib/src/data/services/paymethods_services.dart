import 'package:dio/dio.dart';

import '../datasources/end_points.dart';
import '../datasources/remote/dio_helper.dart';

class PaymethodsServices {
  // String sysAc = CacheHelper.getData(key: 'sysac');
  String sysAc =
      'em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU';

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
