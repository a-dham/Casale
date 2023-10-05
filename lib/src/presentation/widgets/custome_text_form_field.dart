import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    super.key,
    required this.labelText,
    @required this.suffixIcon,
    required this.obscureText,
    required this.keyboardType,
    @required this.textEditingController,
    @required this.validator,
    @required this.onSubmitted,
    @required this.onchanged,
    @required this.onTap,
  });
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final void Function(String)? onchanged;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: onTap,
        onChanged: onchanged,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        controller: textEditingController,
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
