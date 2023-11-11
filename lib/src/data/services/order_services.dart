// ignore_for_file: avoid_print
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:dio/dio.dart';

import '../datasources/local/cashe_helper.dart';

class OrderServices {
  Future<Map<String, dynamic>> getOrders() async {
    String sysAcc = await CacheHelper.getData(key: 'sysac');
    // String sysAcc =
    //     'em5jY3hhZWNhNm16NzQyeno3NDVjejc0cWM0NHJuMzR6ejQxd3Y1M3p6NjJ0bTMxcm4xMWVtMTFxYzUyenozNHp6MjN3djgxc2I1M3JuOTU';
    try {
      Response? response = await DioHelper.getData(
          url: EndPoints.baseUrl,
          queryParameters: {
            "flr": "casale/manage/sales/invoices/views",
            "rtype": "json",
            "sysac": sysAcc
          });
      return response?.data;
    } catch (error) {
      print('error from services ${error.toString()}');
      return {};
    }
  }
}
