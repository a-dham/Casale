import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/auth/auth_cubit.dart';
import 'package:casale/src/cubits/order_%20cubit/order_cubit.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/cubits/product_cubit/products_cubit.dart';
import 'package:casale/src/cubits/settings/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/routes/app_router.dart';
import 'presentation/views/settings/widgets/settings_controller.dart';

class Casale extends StatelessWidget {
  const Casale({
    super.key,
    required this.settingsController,
    required this.initpage,
    // required this.locale,
  });

  final SettingsController settingsController;
  final String? initpage;
  // final Locale? locale;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
            BlocProvider(create: (context) => SettingsCubit()),
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => OrderCubit()),
            BlocProvider(create: (context) => PosCubit()),
          ],
          child: BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) {},
            builder: (context, state) {
              SettingsCubit settingsCubit = SettingsCubit.get(context);
              return MaterialApp(
                restorationScopeId: 'app',
                locale: settingsCubit.locale,
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
              );
            },
          ),
        );
      },
    );
  }
}
