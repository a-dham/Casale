import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_router.dart';
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

  // signOut() async {
  //   emit(SignOutStateLoading());
  //   isloading = true;
  //   await CacheHelper.removeData(key: 'sysac');
  //   emit(SignOutStateSuccess());
  // }

  void signOut(BuildContext context) async {
    emit(SignOutStateLoading());
    isloading = true;
    try {
      Future.delayed(const Duration(
        seconds: 1,
      ));
      Navigator.pushReplacementNamed(context, Routes.login);

      await CacheHelper.removeData(key: 'sysac');
      isloading = false;
      selectedIndex = 0;
      emit(SignOutStateSuccess());
    } catch (error) {
      isloading = false;
      // emit(SignOutStateError(error.toString())); // إرسال حالة الخطأ مع الرسالة إلى واجهة المستخدم
    }
  }
}


        //  Future.delayed(
        //     Duration(seconds: 1),
        //   ).then((value) {
            
        //     settingsCubit.isloading = false;
        //   })