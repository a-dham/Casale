// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import '../datasources/local/cashe_helper.dart';

class ItemsServices {
  String sysAc = CacheHelper.getData(key: 'sysac');

  Future<Map<String, dynamic>> getItems() async {
    try {
      Response? response =
          await DioHelper.getData(url: EndPoints.baseUrl, queryParameters: {
        'flr': 'casale/manage/items/views',
        'sysac': sysAc,
        'rtype': 'json',
      });
      return response?.data;
    } catch (error) {
      print(error.toString());
      return {};
    }
  }
}
