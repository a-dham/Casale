import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/invoice_body.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/items.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/sections.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PosTablet extends StatelessWidget {
  const PosTablet({super.key});

  // getCurrnteLocal(context) {
  //   Locale currnetLocal = Localizations.localeOf(context);
  // }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final PosCubit posCubit = PosCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<PosCubit, PosState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            top: true,
            child: Row(
              children: [
                Container(
                  width: screenWidth - 400,
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
                        width: 30,
                      ),
                      const SearchSeactions(),
                      Sections(),
                      const ItemsHeader(),
                      const Items(),
                    ],
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                    minWidth: 150,
                  ),
                  color: AppColors.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: const InvoiceBody(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
