import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/customer/customer.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/item_head.dart';
import 'package:casale/src/presentation/views/pos/pos_home/widget/search_sections.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/filterd_items.dart';
import '../widget/invoice.dart';
import '../widget/items.dart';
import '../widget/sections.dart';

class PosMobile extends StatelessWidget {
  const PosMobile({super.key});

  @override
  Widget build(BuildContext context) {
    PosCubit posCubit = PosCubit.get(context);

    // final orgLogo = networkImage(
    //   cache: true,
    //   '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
    // );
    // ignore: avoid_print
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          minimum: const EdgeInsets.only(
            top: 15,
            right: 5,
            left: 5,
          ),
          child: Scaffold(
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
                toolbarHeight: 44,
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

                      // Container(
                      //   constraints: BoxConstraints(
                      //     maxHeight: 60,
                      //   ),
                      //   child: ExtendedImage.network(
                      //     '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
                      //     height: 40,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),

                      // Image.network(
                      //   '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
                      //   fit: BoxFit.scaleDown,
                      //   width: double.infinity,
                      //   height: 85,
                      //   errorBuilder: (context, object, stacktrace) {
                      //     return Image.asset(
                      //         fit: BoxFit.scaleDown,
                      //         width: double.infinity,
                      //         height: 85,
                      //         'assets/images/error-loading-items.gif');
                      //   },
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress == null) {
                      //       return child;
                      //     } else {
                      //       return const CustomeCircularProgress();
                      //     }
                      //   },
                      //   // frameBuilder:
                      //   //     (context, child, frame, wasSynchronouslyLoaded) =>
                      //   //         child,
                      // ),

                      // Container(
                      //   constraints: const BoxConstraints(
                      //     maxHeight: 50,
                      //     maxWidth: 50,
                      //   ),
                      //   child: Image.asset(
                      //     'assets/images/ows_logo.png',
                      //   ),

                      //     Image(
                      //   image: CachedNetworkImageProvider(
                      //     '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
                      //   ),
                      // ),

                      //     Image.network(
                      //   '${EndPoints.assetsUrl}${posCubit.orgData?.data?.logo}',
                      //   fit: BoxFit.scaleDown,
                      // ),
                      // ),
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
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 150,
                            ),
                            child: Text(
                              posCubit.loginModel?.data?.accountTitle ??
                                  'No title',
                              style: const TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //     vertical: 10,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.black.withOpacity(0.04),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       const Spacer(),
                      //       TextButton.icon(
                      //         onPressed: () async {
                      //           if (posCubit.customers.isEmpty) {
                      //             await posCubit.getCustomers().then((value) {
                      //               Customer().showAlert(context, posCubit);
                      //             });
                      //           } else {
                      //             Customer().showAlert(context, posCubit);
                      //           }
                      //         },
                      //         icon: const Icon(
                      //           Icons.add,
                      //           color: Colors.black,
                      //         ),
                      //         label: Text(
                      //           posCubit.customerName != null
                      //               ? posCubit.customerName.toString()
                      //               : S.current.cusotmer,
                      //           style: const TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50,
                      //   width: 50,
                      //   child: CustomerSection(posCubit: posCubit),
                      // ),
                      // SvgPicture.asset(
                      //   'assets/images/logo.svg',
                      //   width: 40,
                      // ),

                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                        ),
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
                            TextButton.icon(
                              onPressed: () async {
                                Customer().showAlert(context, posCubit);
                              },
                              icon: Icon(
                                posCubit.customerName != null
                                    ? Icons.check
                                    : Icons.add,
                                color: Colors.black,
                              ),
                              label: Text(
                                posCubit.customerName != null
                                    ? posCubit.customerName.toString()
                                    : S.current.cusotmer,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  const SearchSeactions(),
                  const SizedBox(
                    height: 5,
                  ),
                  Sections(
                    posCubit: posCubit,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ItemsHeader(),
                  posCubit.isSearched == false
                      ? const Items()
                      : const FiltteredItems(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
        );
      },
    );
  }
}
