import 'package:casale/src/presentation/views/auth/login/login.dart';
import 'package:casale/src/presentation/views/auth/signup/signUp.dart';
import 'package:casale/src/presentation/views/bottom_navigation/bottom_navigation.dart';
import 'package:casale/src/presentation/views/home/home.dart';
import 'package:casale/src/presentation/views/onboarding/onboarding.dart';
import 'package:casale/src/presentation/views/payment/payment.dart';
import 'package:casale/src/presentation/views/payment/widget/print.dart';
import 'package:casale/src/presentation/views/pos/pos_home/pos_home.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/extra.dart';
import 'package:casale/src/presentation/views/pos/pos_login/pos_login.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_controller.dart';
import 'package:casale/src/presentation/views/settings/widgets/settings_view.dart';
import 'package:casale/src/presentation/views/splash/splash.dart';
import 'package:casale/src/utils/constant/app_strings.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onBoarding';
  static const String login = '/login';
  static const String signup = '/sign_up';
  static const String home = '/home';
  static const String posLogin = '/posLogin';
  static const String extra = '/extra';
  static const String print = '/print';
  static const String bottomNavigation = '/bottomNavigation';
  static const String posHome = '/posHome';
  static const String payment = '/payment';
  static const String setting = '/settings';
}

class AppRouter {
  AppRouter(this.settingsController);
  final SettingsController settingsController;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );

      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => const Signup(),
        );
      case Routes.posLogin:
        return MaterialPageRoute(
          builder: (_) => PosLogin(),
        );
      case Routes.posHome:
        return MaterialPageRoute(
          builder: (_) => POSHome(),
        );
      case Routes.extra:
        return MaterialPageRoute(
          builder: (_) => const Extra(),
        );
      case Routes.bottomNavigation:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigation(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case Routes.payment:
        return MaterialPageRoute(
          builder: (_) => const Payment(),
        );
      case Routes.print:
        return MaterialPageRoute(
          builder: (_) => const Print(),
        );
      case Routes.setting:
        return MaterialPageRoute(
            builder: (_) => SettingsView(controller: settingsController));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
