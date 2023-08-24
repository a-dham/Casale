import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/invoice.dart';
import 'widget/items.dart';
import 'widget/sections.dart';

class POSHome extends StatelessWidget {
  const POSHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Locale currnetLocal = Localizations.localeOf(context);
    print(currnetLocal);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orangeColor,
          tooltip: 'show inv Itmes',
          onPressed: () {
            Invoice().settingModalBottomSheet(context);
          },
          child: const Icon(
            Icons.request_page_rounded,
          ),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 0,

          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/accont_avatar.svg',
                  width: 40,
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Text(
                      S.current.account_title,
                      style: const TextStyle(
                        color: AppColors.orangeColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'AZOZ',
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: AppColors.greyColor,
                    size: 29,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 40,
                ),
              ],
            ),
          ),
          // actions: [

          // ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 10,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Azozy Cafee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        S.current.sections,
                        style: const TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: screenWidth * 0.60,
                    height: 30,
                    child: CustomeTextFormField(
                      labelText: S.current.search,
                      suffixIcon: const Icon(Icons.search),
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Sections(),
            const SizedBox(
              height: 10,
            ),
            const Items(),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

// SizedBox(
//               width: 220,
//               height: 40,
//               child: CustomeTextButton(
//                   childWidget: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 30,
//                           alignment: Alignment.center,
//                           decoration: const BoxDecoration(
//                               color: AppColors.whiteColor,
//                               shape: BoxShape.circle),
//                           child: const Text(
//                             'X3',
//                             style: TextStyle(
//                               color: AppColors.orangeColor,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const Text(
//                           'Invoice',
//                           style: TextStyle(
//                             color: AppColors.whiteColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                         ),
//                         const Spacer(),
//                       ]),
//                   borderwidth: 0,
//                   isBorder: BorderStyle.none,
//                   backgroundColor: AppColors.orangeColor,
//                   elevation: 2,
//                   onPressed: () {},
//                   minimumSize: null,
//                   borderRaduis: BorderRadius.circular(15)),
//             ),