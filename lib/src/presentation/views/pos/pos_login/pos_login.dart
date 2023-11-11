import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/routes/app_router.dart';

class PosLogin extends StatelessWidget {
  const PosLogin({super.key});

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
                      S.current.pos,
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
                    labelText: S.current.pin,
                    suffixIcon: const Icon(Icons.key_outlined),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    textEditingController: null,
                    validator: (value) {
                      return null;
                    },
                    onSubmitted: (string) {},
                    onTap: () {},
                    onchanged: (string) {},
                    inputFormamatters: const [],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomeTextButton(
                    childWidget: Text(
                      S.current.login,
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    borderRaduis: BorderRadius.circular(15),
                    borderwidth: 0,
                    isBorder: BorderStyle.none,
                    backgroundColor: AppColors.orangeColor,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.bottomNavigation, (route) => false);
                    },
                    minimumSize: Size(screenHeight, 45),
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
