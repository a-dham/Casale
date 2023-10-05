import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0,
        backgroundColor: AppColors.orangeColor,
        title: const Text("CASAlE OFFLINE "),
      ),
      body: Center(child: Image.asset("assets/images/network_error.gif")),
    );
  }
}
