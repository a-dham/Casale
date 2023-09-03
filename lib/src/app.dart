import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/auth/auth_cubit.dart';
import 'package:casale/src/cubits/product_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/app_router.dart';
import 'cubits/navigation_cubit/navigation_cubit.dart';
import 'presentation/views/settings/widgets/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.initpage,
  });

  final SettingsController settingsController;
  final String? initpage;
  @override
  Widget build(BuildContext context) {
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
            BlocProvider(create: (context) => AuthCubit()),
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
            initialRoute: initpage ?? Routes.splash,
          ),
        );
      },
    );
  }
}
