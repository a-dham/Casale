// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class ItemsServices {
  String sysAc = CacheHelper.getData(key: 'sysac');

  Future<Map<String, dynamic>> getItems() async {
    try {
      Response? response =
          await DioHelper.postData(url: EndPoints.baseUrl, data: {
        'flr': sysAc,
      }, queryParameters: {
        'flr': 'casale/manage/items/views',
        'sysac': sysAc,
        'rtype': 'json',
        'dtype': 'json',
      });
      return response?.data;
    } catch (error) {
      print(error.toString());
      return {};
    }
  }
}
