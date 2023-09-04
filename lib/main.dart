// ignore_for_file: avoid_print

import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/presentation/views/settings/widgets/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  String? initPage;
  var sysAcc = CacheHelper.getData(key: 'sysacc');
  bool? onboarding = CacheHelper.getData(key: 'onboarding');

  if (onboarding != null) {
    if (sysAcc != null) {
      print('tokennnnn $sysAcc');
      initPage = Routes.bottomNavigation;
    } else {
      initPage = Routes.login;
    }
  } else {
    initPage = Routes.splash;
  }

  print(initPage);
  print(onboarding);
  print(sysAcc);

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(
    settingsController: settingsController,
    initpage: initPage,
  ));
}
