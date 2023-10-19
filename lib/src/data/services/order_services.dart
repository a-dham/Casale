// ignore_for_file: avoid_print
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class OrderServices {
  Future<Map<String, dynamic>> getOrders() async {
    String sysAcc = await CacheHelper.getData(key: 'sysac');
    try {
      Response? response =
          await DioHelper.postData(url: EndPoints.baseUrl, data: {
        "sysac": sysAcc
      }, queryParameters: {
        "flr": "casale/manage/sales/invoices/views",
        "rtype": "json",
        "dtype": "json",
        "sysac": sysAcc
      });
      return response?.data;
    } catch (error) {
      print('error from services ${error.toString()}');
      return {};
    }
  }
}
