import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PageviewBody extends StatelessWidget {
  const PageviewBody({
    super.key,
    required this.image,
    required this.title,
    required this.explanationText,
  });

  final String image;
  final String title;
  final String explanationText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Image.asset(
            image,
            height: 350,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.orangeColor,
            fontFamily: 'Cairo',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 250,
          child: Text(
            explanationText,
            style: const TextStyle(
              color: AppColors.greyColor,
              fontFamily: 'Cairo',
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
