import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeCircularProgress extends StatelessWidget {
  const CustomeCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.whiteColor,
      color: AppColors.orangeColor,
      strokeWidth: 2,
    );
  }
}
