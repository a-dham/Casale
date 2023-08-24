import 'package:casale/src/config/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          const Spacer(),
          SvgPicture.asset('assets/images/logo.svg'),
          const Spacer(),
          SvgPicture.asset('assets/images/ows_logo.svg'),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  void nextScreen() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, Routes.onboarding, (route) => false));
  }
}
