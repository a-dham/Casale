import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/presentation/views/pos/pos_home/mobile/pos_mobile.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/pos_tablet.dart';
import 'package:casale/src/presentation/views/reponsive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class POSHome extends StatelessWidget {
  POSHome({super.key});
  Dio dio = Dio();
  getData() async {
    var responsee = await dio.post(
        'https://dev.orgswebteam.com/?flr=acc/login/sysac&sysac=none&rtype=json',
        queryParameters: {'un': 'adham', 'up': 'adham'});

    // Response? responseee = await DioHelper.postData(
    //     url:
    //         'https://dev.orgswebteam.com/?flrpath=casale/manage/items/views&flr=casale/api&rtype=1&sysac=Y3hjbmZoY3hoNW56NzQyeno3NDVuejc0cWMzNHd2MjNzYjIxZm4zNHRtODE&fmtd=api@views1&keepfmtd=full',
    //     data: null,
    //     queryParameters: null);

    // Response? response = await DioHelper.getData(
    //     url:
    //         'https://dev.orgswebteam.com/?flrpath=casale/manage/items/views&flr=casale/api&rtype=1&sysac=Y3hjbmZoY3hoNW56NzQyeno3NDVuejc0cWMzNHd2MjNzYjIxZm4zNHRtODE&fmtd=api@views1&keepfmtd=full');

    // print('ressssssssponse ${responseee}');
    // print('------------------------------ressponse ${response}');
    print('----ressponse ${responsee}');
  }

  @override
  Widget build(BuildContext context) {
    getData();
    double width = MediaQuery.of(context).size.width;
    String data = Responive().isMobile(width);
    if (data == 'tablet') {
      return const PosTablet();
    } else {
      return const PosMobile();
    }
  }
}
