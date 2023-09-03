// ignore_for_file: avoid_print

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/auth/auth_cubit.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/presentation/views/auth/widgets/footer.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final Dio dio = Dio();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthStateSuccess) {
          print('state success');
          CacheHelper.saveData(key: 'sysacc', value: state.loginModel.data)
              .then(
            (value) => Navigator.pushNamedAndRemoveUntil(
                context, Routes.posHome, (route) => false),
          );
        } else if (state is AuthStateLoading) {
          const CircularProgressIndicator();
        }

        AuthCubit authcubit = AuthCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
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
                          textEditingController: userNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return S.current.notNull;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        CustomeTextFormField(
                          labelText: S.current.password,
                          suffixIcon: const Icon(Icons.key_outlined),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textEditingController: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return S.current.notNull;
                            }
                            return null;
                          },
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
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              authcubit.login(
                                userNameController.text.toString(),
                                passwordController.text.toString(),
                              );
                            }
                          },
                          minimumSize: Size(screenWidth * 0.4, 45),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Spacer(),
                        Footer(
                          onTab: () =>
                              Navigator.pushNamed(context, Routes.signup),
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
          ),
        );
      },
    );
  }
}
