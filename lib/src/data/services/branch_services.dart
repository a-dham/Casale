import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class BranchServices {
  String sysAc = CacheHelper.getData(key: 'sysac');
  Future<Map<String, dynamic>> getLinkedBranchData() async {
    Response? response = await DioHelper.getData(
        url: EndPoints.baseUrl,
        queryParameters: {
          "flr": "casale/pos",
          "rtype": "json",
          "sysac": sysAc
        });
    return response?.data;
  }
}
