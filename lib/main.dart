// ignore_for_file: avoid_print

import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:flutter/material.dart';
import 'src/casale.dart';
import 'src/presentation/views/settings/widgets/settings_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DioHelper.init();
  await CacheHelper.init();
  // var box = await Hive.openBox('settings');
  // // box.put('darkMode', true);
  // print('Is Dark Mode: ${box.get('darkmode', defaultValue: false)}');

  String? initPage;
  var sysac = CacheHelper.getData(key: 'sysac');
  // CacheHelper.removeData(key: 'sysac');'
  bool? onboarding = await CacheHelper.getData(key: 'onboarding');
  String? locale = await CacheHelper.getData(key: 'localization');

  if (onboarding != null) {
    if (sysac != null) {
      print('sysac $sysac');
      initPage = Routes.bottomNavigation;
    } else {
      initPage = Routes.login;
    }
  } else {
    initPage = Routes.splash;
  }
  print(initPage);
  print(onboarding);
  print(sysac);
  print(locale);

  // initPage = Routes.bottomNavigation;

  // OrderRepository().getOrders();
  // final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // final windowsInfo = await deviceInfo.windowsInfo;
  // String deviceId = windowsInfo.deviceId;
  // print('"---------------------"');
  // print(deviceId);

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(Casale(
    settingsController: settingsController,
    initpage: initPage,
  ));
}
