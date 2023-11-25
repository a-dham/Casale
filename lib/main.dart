import 'dart:io';

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

  String? initPage;
  var sysac = CacheHelper.getData(key: 'sysac');
  bool? onboarding = await CacheHelper.getData(key: 'onboarding');

  if (onboarding != null) {
    if (sysac != null) {
      initPage = Routes.bottomNavigation;
    } else {
      initPage = Routes.login;
    }
  } else {
    initPage = Routes.splash;
  }

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  HttpOverrides.global = MyHttpOverrides();

  runApp(Casale(
    settingsController: settingsController,
    initpage: initPage,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
