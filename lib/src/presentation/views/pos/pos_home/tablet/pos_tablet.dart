import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/items.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/sections.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PosTablet extends StatelessWidget {
  const PosTablet({super.key});

  // getCurrnteLocal(context) {
  //   Locale currnetLocal = Localizations.localeOf(context);
  // }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.6,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              color: const Color(0XFFf8f8f8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: screenWidth * 0.03,
                  ),
                  const SearchSeactions(),
                  const Sections(),
                  const ItemsHeader(),
                  const Items(),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.4,
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/accont_avatar.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            S.current.pos,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.44),
                            ),
                          ),
                          const Text(
                            'abdelaziz',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        color: Colors.black,
                        icon: const Icon(
                          Icons.notification_add,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.04),
                    ),
                    child: Row(
                      children: [
                        Text(
                          S.current.invoice,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          label: Text(
                            S.current.cusotmer,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ItemsInvoice(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
