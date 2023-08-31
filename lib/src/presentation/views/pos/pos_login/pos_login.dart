import 'package:casale/generated/l10n.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/routes/app_router.dart';

class PosLogin extends StatelessWidget {
  PosLogin({super.key});

  final dio = Dio();

  void getHttp() async {
    // final response = await dio.get('https://dev.orgswebteam.com/?r=home/login');
    //   final response1 = await dio.post(
    //       'https://dev.orgswebteam.com/?r=home/login',
    //       data: {'up': 'adham', 'un': 'adham'});
    //   print(' print 1 :${response1}');
    //   final response = await dio.get(
    //       'https://dev.orgswebteam.com//?flr=casale/manage&sysac=ZWNjRE16em5iNW56NzQ2bXo3NDduejc0c2I4M3p6Njd3djgzd3YzNHRtNjJheDYy&ot=sinv&oid=hmcbaabaaDMab1x09517a16755n144tm13qc61zz521vz72pa83jbcjbf&rtype=taxinv');
    //   print(' print2:${response}');
    var response = await dio.post(
        'https://dev.orgswebteam.com//?flr=casale/manage/branches&rtype=getorders&bid=1&ot=sinv&sysac=Y3hjaG16amJiNm16NzQyeno3NDhtejc0Zm44M3NiNjdmbjgzcm4zNGZuNjJwYTYy&fmtd=manage@views1&keepfmtd=full');
    var cookie = response.headers['set-cookie']![0];
    print(cookie.toString().runtimeType);

    CacheHelper.saveData(key: 'sessid', value: cookie).then((value) {
      print(response.statusCode);
      print(response.statusMessage);
      print(response);
      print(cookie);
      print(cookie.runtimeType);
    });
  }

  void getData() async {
    // var response = await dio.post(
    //     'https://dev.orgswebteam.com//?flr=casale/manage/branches&rtype=getorders&bid=5&ot=pcnote&sysac=em5jY3h6Z3ZiMXZ6NzQ1bno3NDdhejc0cGE4M3BhNjd0bTgzZW0zNHp6NjJwYTYy&fmtd=manage@views1&keepfmtd=full',
    //    options: Options(
    //     headers: {
    //       'set-cookie':'PHPSESSID=13591f00a80d832ee63e749297c942a5',
    //     }
    //    )

    //    );
    // print('-----------------------');
    // print(response.statusCode);
    // print(response.statusMessage);
    // print(response);
  }

  @override
  Widget build(BuildContext context) {
    // getHttp();
    // getData();

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
