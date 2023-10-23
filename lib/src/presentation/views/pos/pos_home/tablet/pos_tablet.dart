import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/invoice_body.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/filterd_items.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/items.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/sections.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PosTablet extends StatefulWidget {
  const PosTablet({super.key});

  @override
  State<PosTablet> createState() => _PosTabletState();
}

class _PosTabletState extends State<PosTablet> {
  @override
  void initState() {
    // (BlocProvider.of<PosCubit>(context).orgData?.data as Map).clear();
    BlocProvider.of<PosCubit>(context).getOrgData();
    BlocProvider.of<PosCubit>(context).getAccountData();
    BlocProvider.of<PosCubit>(context).getItems();
    BlocProvider.of<PosCubit>(context).getItemSections();
    super.initState();
  }

  // getCurrnteLocal(context) {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<PosCubit, PosState>(
        listener: (context, state) async {
          // if (state is PosInitial) {
          // print('init state');
          // await posCubit.getOrgData();
          // await posCubit.getAccountData();
          // }
        },
        builder: (context, state) {
          PosCubit posCubit = PosCubit.get(context);
          return SafeArea(
            top: true,
            child: Row(
              children: [
                Container(
                  width:
                      screenWidth < 780 ? screenWidth - 250 : screenWidth - 400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  color: const Color(0XFFf8f8f8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 80,
                              maxWidth: 70,
                            ),
                            child: Image.network(
                              '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
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
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const CustomeCircularProgress();
                                }
                              },
                              frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) =>
                                  child,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 250,
                            ),
                            child: Text(
                              posCubit.orgData?.data!.orgTitle.toString() ??
                                  'no Title',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 30,
                          ),
                        ],
                      ),
                      const SearchSeactions(),
                      Sections(
                        posCubit: posCubit,
                      ),
                      const ItemsHeader(),
                      posCubit.isSearched == false
                          ? state is ItemsStateLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.orangeColor,
                                  ),
                                )
                              : const Items()
                          : const FiltteredItems(),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth < 780 ? 250 : 400,
                    minWidth: 150,
                    maxHeight: double.infinity,
                  ),
                  color: AppColors.whiteColor,
                  height: 100000,
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
