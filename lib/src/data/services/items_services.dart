// ignore_for_file: avoid_print

import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import '../datasources/local/cashe_helper.dart';

class ItemsServices {
  Future<Map<String, dynamic>> getItems() async {
    String sysAc = await CacheHelper.getData(key: 'sysac');
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
