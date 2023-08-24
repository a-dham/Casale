import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Invoice {
  void settingModalBottomSheet(context) {
    Locale currnetlocal = Localizations.localeOf(context);
    print(currnetlocal);
    showModalBottomSheet(
        useSafeArea: false,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.90,
        ),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 900,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: currnetlocal == 'ar'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            S.current.invoice,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            height: 190,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {},
                                    title: const Text('Black Coffe'),
                                    leading:
                                        Image.asset('assets/images/item.png'),
                                    subtitle: const Row(
                                      children: [
                                        Text(
                                          'ice',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '1X',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '10 SAR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 2,
                                    color: AppColors.orangeColor,
                                  );
                                },
                                itemCount: 10))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(S.current.price),
                            const Spacer(),
                            const Text('30 SAR'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(S.current.afterTax),
                            const Spacer(),
                            const Text('30 SAR'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            '------------------------------------------------------------------------------------------',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: Colors.black.withOpacity(0.44),
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(S.current.total),
                            const Spacer(),
                            const Text('30 SAR'),
                          ],
                        ),
                        CustomeTextButton(
                          childWidget: Text(
                            S.current.payment,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          borderwidth: 0,
                          isBorder: BorderStyle.none,
                          backgroundColor: AppColors.orangeColor,
                          elevation: 1,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.payment);
                          },
                          minimumSize: const Size(200, 20),
                          borderRaduis: BorderRadius.circular(10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
