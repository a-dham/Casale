// ignore_for_file: file_names

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/presentation/views/auth/widgets/footer.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.09,
          ),
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: 100,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      S.current.signup,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        letterSpacing: 2,
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.email,
                    suffixIcon: const Icon(Icons.email),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.username,
                    suffixIcon: const Icon(Icons.person),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.password,
                    suffixIcon: const Icon(Icons.key_outlined),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.confirmPassword,
                    suffixIcon: const Icon(Icons.key_outlined),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomeTextButton(
                    childWidget: Text(
                      S.current.signup,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    borderRaduis: BorderRadius.circular(15),
                    borderwidth: 0,
                    isBorder: BorderStyle.none,
                    backgroundColor: AppColors.orangeColor,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.home);
                    },
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  Footer(
                    onTab: () => Navigator.pushNamed(context, Routes.login),
                    buttonText: S.current.login,
                    text: S.current.haveAccount,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
