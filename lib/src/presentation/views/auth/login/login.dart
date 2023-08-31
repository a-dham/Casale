import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/presentation/views/auth/widgets/footer.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  Login({super.key});
  Dio dio = Dio();
  var sessId = CacheHelper.getData(key: 'sessid');

  void getData(var sessid) async {
    var response = await dio.post(
        'https://dev.orgswebteam.com//?flr=casale/manage/branches&rtype=getorders&bid=5&ot=pcnote&sysac=em5jY3h6Z3ZiMXZ6NzQ1bno3NDdhejc0cGE4M3BhNjd0bTgzZW0zNHp6NjJwYTYy&fmtd=manage@views1&keepfmtd=full',
        options: Options(headers: {
          'set-cookie': sessid,
        }));
    print('-----------------------');
    print(response.statusCode);
    print(response.statusMessage);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    print(sessId);
    getData(sessId);
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: screenHeight * 0.1,
          ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      S.current.login,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        letterSpacing: 2,
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.username,
                    suffixIcon: const Icon(Icons.person),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomeTextFormField(
                    labelText: S.current.password,
                    suffixIcon: const Icon(Icons.key_outlined),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.current.forget_password,
                      style: const TextStyle(
                          fontSize: 15, color: AppColors.orangeColor),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomeTextButton(
                    childWidget: Text(
                      S.current.login,
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
                    onTab: () => Navigator.pushNamed(context, Routes.signup),
                    buttonText: ' ${S.current.signup} ',
                    text: S.current.dontHaveAccount,
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
