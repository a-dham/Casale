import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  // theme mode selection

  changeThemeMode() {}

  // language selection
  Locale locale = const Locale('ar');
  changeDefaultlanguage() async {
    emit(SettingsInitial());
    String countryCode = Intl.getCurrentLocale();
    countryCode == 'ar'
        ? S.load(const Locale('en'))
        : S.load(const Locale('ar'));
    locale = Locale(countryCode);
    // await CacheHelper.saveData(key: 'currentLanguage', value: locale);
    emit(LanguageStateSuccess());
  }

  signOut(BuildContext context) {
    CacheHelper.removeData(key: 'sysac').then((value) {
      Navigator.popAndPushNamed(context, Routes.login);
    });
    emit(SignOutStateSuccess());
  }
}
