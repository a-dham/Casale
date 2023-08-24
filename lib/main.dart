import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/presentation/views/settings/widgets/settings_service.dart';

void main() async {
  // Random random = Random(100);
  // int number = random.nextInt(10);
  // // print('random 1 :${number.isEven}');
  // print('Random number: $number');
  // if (number % 2 == 0) {
  //   print('The number is even.');
  // } else {
  //   print('The number is odd.');
  // }
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
