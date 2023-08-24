import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.onTab,
    required this.text,
    required this.buttonText,
  });

  final Function() onTab;
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.black.withOpacity(0.50)),
        ),
        GestureDetector(
          onTap: onTab,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.posLogin);
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              AppColors.orangeColor,
            ),
          ),
          child: Text(
            S.current.pos,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
