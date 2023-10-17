import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/views/Orders/orders.dart';
import '../../presentation/views/pos/pos_home/pos_home.dart';
import '../../presentation/views/settings/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  bool isloading = false;

  navigation(int index) {
    selectedIndex = index;
    emit(NavigationSuccess());
  }

  List<Widget> bottomNavigationscreens = [
    const POSHome(),
    const Orders(),
    const Settings(),
  ];

  // theme mode selection
  changeThemeMode() {}

  // language selection
  // String currentLocal = CacheHelper.getData(key: 'localization');

  Locale locale = const Locale('ar');
  changeDefaultlanguage(String countryCode) async {
    emit(SettingsInitial());
    locale = Locale(countryCode);
    await CacheHelper.saveData(key: 'localization', value: countryCode);
    // ignore: avoid_print
    // print('  local from function $test');
    emit(LanguageStateSuccess());
  }

  signOut() async {
    emit(SignOutStateLoading());
    isloading = true;
    await CacheHelper.removeData(key: 'sysac');
    emit(SignOutStateSuccess());
  }
}
