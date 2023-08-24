import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    required this.obscureText,
    required this.keyboardType,
  });
  final String labelText;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        keyboardType: keyboardType,
        cursorColor: AppColors.orangeColor,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 15,
          ),
          labelText: labelText,
          suffixIconColor: AppColors.orangeColor,
          labelStyle: const TextStyle(color: AppColors.orangeColor),
          filled: true,
          semanticCounterText: '10',
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.orangeColor),
              gapPadding: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lightGreyColor),
            gapPadding: 0,
          ),
        ),
      ),
    );
  }
}
