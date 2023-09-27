// ignore_for_file: avoid_print

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Invoice {
  void settingModalBottomSheet(context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Locale currnetlocal = Localizations.localeOf(context);
    print(currnetlocal);
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        constraints: BoxConstraints(
          minHeight: screenHeight,
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
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
                        alignment: Alignment.centerRight,
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
                      Container(
                          constraints:
                              BoxConstraints(maxHeight: screenHeight * 0.75),
                          child: const ItemsInvoice())
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
