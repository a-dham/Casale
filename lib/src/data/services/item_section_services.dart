// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import '../datasources/local/cashe_helper.dart';

class ItemSectionsServices {
  Future getItemsSections() async {
    var sysAcc = await CacheHelper.getData(key: "sysac");

    try {
      Response? response = await DioHelper.postData(
          url: EndPoints.baseUrl,
          data: {},
          queryParameters: {
            "flr": "casale/manage/settings/inputoptions/itemstypes/views",
            "sysac": sysAcc,
            "rtype": "json",
            "dtype": "json",
          });
      return response?.data;
    } catch (error) {
      print(error.toString());
      return {};
    }
  }
}
