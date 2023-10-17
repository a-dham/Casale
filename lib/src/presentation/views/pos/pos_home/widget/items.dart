// ignore_for_file: prefer_is_empty

import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PosCubit posCubit = PosCubit.get(context);
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return posCubit.items!.isEmpty
            ? const Center(child: CustomeCircularProgress())
            : Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width >= 730 ? 4 : 2,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 150,
                    ),
                    itemCount: posCubit.isSearched == true
                        ? posCubit.filterdItems?.length
                        : posCubit.items!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      // final item = posCubit.isSearched != true
                      //     ? posCubit.filterdItems![index]
                      //     : posCubit.itemModel?.dataList[index];

                      final Data item = posCubit.items?[index];
                      return GestureDetector(
                        onTap: () {
                          posCubit.addItemTocart(item);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.whiteColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            border: Border.all(
                              width: 2,
                              color: AppColors.lightGreyColor,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Image.network(
                                '${EndPoints.assetsUrl}${item.image}',
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
                              const Spacer(),
                              Text(
                                style: const TextStyle(
                                    color: Color(0xff12141E),
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                                item.arabicTitle ?? '',
                              ),
                              Text(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                  item.units.length == 0
                                      ? 'No Price !!'
                                      : item.units[0].unitPrice ?? ''),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      },
    );
  }
}


      // Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 10),
      //               child: CustomeTextButton(
      //                   childWidget: const Text(
      //                     'Add',
      //                     style: TextStyle(color: Colors.black),
      //                   ),
      //                   borderwidth: 0,
      //                   isBorder: BorderStyle.none,
      //                   backgroundColor: const Color(0xffF4F4F4),
      //                   elevation: 1,
      //                   onPressed: () {},
      //                   minimumSize: const Size(double.infinity, 17),
      //                   borderRaduis: BorderRadius.circular(10)),
      //             )