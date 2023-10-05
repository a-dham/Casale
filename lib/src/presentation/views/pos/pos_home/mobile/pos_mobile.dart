import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/datasources/end_points.dart';
import '../../../../widgets/circular_progress.dart';
import '../widget/invoice.dart';
import '../widget/items.dart';
import '../widget/sections.dart';

class PosMobile extends StatelessWidget {
  const PosMobile({super.key});

  @override
  Widget build(BuildContext context) {
    PosCubit posCubit = PosCubit.get(context);
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: Badge(
              alignment: Alignment.topRight,
              label: Text(posCubit.cart.length.toString()),
              isLabelVisible: true,
              backgroundColor: Colors.green[900],
              child: FloatingActionButton(
                backgroundColor: AppColors.orangeColor,
                tooltip: 'show inv Itmes',
                onPressed: () {
                  Invoice().settingModalBottomSheet(context);
                },
                child: const Icon(
                  Icons.request_page_rounded,
                ),
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
                    // SvgPicture.asset(
                    //   'assets/images/accont_avatar.svg',
                    //   width: 40,
                    // ),

                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 50,
                      ),
                      child: Image.network(
                        '${EndPoints.assetsUrl}${posCubit.orgModel?.data?.logo}',
                        fit: BoxFit.scaleDown,
                        width: double.infinity,
                        height: 85,
                        errorBuilder: (context, object, stacktrace) {
                          return Image.asset(
                              fit: BoxFit.scaleDown,
                              width: double.infinity,
                              height: 85,
                              'assets/images/error-loading-items.gif');
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const CustomeCircularProgress();
                          }
                        },
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) =>
                                child,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      children: [
                        Text(
                          S.current.pos,
                          style: const TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          posCubit.loginModel?.data?.accountTitle ?? 'No title',
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                const SearchSeactions(),
                const SizedBox(
                  height: 10,
                ),
                Sections(),
                const SizedBox(
                  height: 10,
                ),
                const ItemsHeader(),
                const Items(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ));
      },
    );
  }
}
