import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/data/datasources/remote/dio_helper.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/presentation/views/settings/widgets/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  String? initPage;
  var sessId = CacheHelper.getData(key: 'sessid');
  bool onboarding = CacheHelper.getData(key: 'onboarding');

  final dio = Dio();

  if (onboarding != null) {
    if (sessId != null) {
      print('tokennnnn ${sessId}');
      initPage = Routes.posHome;
    } else {
      initPage = Routes.posLogin;
    }
  } else {
    initPage = Routes.splash;
  }

  print(initPage);
  print(onboarding);
  print(sessId);

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(
    settingsController: settingsController,
    initpage: initPage,
  ));
}
