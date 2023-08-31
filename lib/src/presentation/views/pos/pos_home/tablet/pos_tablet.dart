import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/invoice_body.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/items.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/sections.dart';
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.6,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
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
                  Sections(),
                  const ItemsHeader(),
                  const Items(),
                ],
              ),
            ),
            const SingleChildScrollView(
              child: InvoiceBody(),
            ),
          ],
        ),
      ),
    );
  }
}
