import 'package:dio/dio.dart';

import '../datasources/end_points.dart';
import '../datasources/local/cashe_helper.dart';
import '../datasources/remote/dio_helper.dart';

class OrgDataServices {
  String sysAc = CacheHelper.getData(key: 'sysac');

  Future<Map<String, dynamic>> getOrgData() async {
    try {
      Response? response = await DioHelper.postData(
          url: EndPoints.baseUrl,
          data: {},
          queryParameters: {
            "flr": "acc/org",
            "dtype": "json",
            "rtype": "json",
            "sysac": sysAc
          });
      return response?.data;
    } catch (error) {
      // ignore: avoid_print
      print('error from services org data  ${error.toString()}');
      return {};
    }
  }
}
