import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/product_cubit/products_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/app_router.dart';
import 'cubits/navigation_cubit/navigation_cubit.dart';
import 'presentation/views/settings/widgets/settings_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  final dio = Dio();

  void getHttp() async {
    // final response = await dio.get('https://dev.orgswebteam.com/?r=home/login');
    //   final response1 = await dio.post(
    //       'https://dev.orgswebteam.com/?r=home/login',
    //       data: {'up': 'adham', 'un': 'adham'});
    //   print(' print 1 :${response1}');
    //   final response = await dio.get(
    //       'https://dev.orgswebteam.com//?flr=casale/manage&sysac=ZWNjRE16em5iNW56NzQ2bXo3NDduejc0c2I4M3p6Njd3djgzd3YzNHRtNjJheDYy&ot=sinv&oid=hmcbaabaaDMab1x09517a16755n144tm13qc61zz521vz72pa83jbcjbf&rtype=taxinv');

    //   print(' print2:${response}');
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductsCubit>(
              create: (context) => ProductsCubit(),
            ),
            BlocProvider(
              create: (context) => NavigationCubit(),
            ),
          ],
          child: MaterialApp(
            restorationScopeId: 'app',
            locale: const Locale('ar'),

            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              fontFamily: 'Cairo',
            ),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            // home: Home(),
            onGenerateRoute: AppRouter(settingsController).onGenerateRoute,
          ),
        );
      },
    );
  }
}
