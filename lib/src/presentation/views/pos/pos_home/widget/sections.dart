import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({
    super.key,
    required this.posCubit,
  });
  final PosCubit posCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.sections,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        // Row(
        //   children: [
        //     // GestureDetector(
        //     //   onTap: () {
        //     //     posCubit.getItems();
        //     //   },
        //     //   child: const Text('Get ALL Items'),
        //     // ),
        //   ],
        // ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
              itemCount: posCubit.sections?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // ignore: prefer_is_empty
                if (posCubit.sections!.length >= 1) {
                  return posCubit.sections?[index].inUse == true
                      ? GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print(
                              'sectionssss ${posCubit.sections?[index].sectionId}',
                            );
                            // fun for filter  item with section id
                            // posCubit.itemsSection(
                            //   posCubit.sections?[index].sectionId,
                            // );
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: 100,
                              maxWidth: 100,
                              minWidth: 80,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.lightGreyColor,
                                )),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/soda.png',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  posCubit.sections?[index].arabicTitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.43),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox();
                }
                return null;
              }),
        ),
      ],
    );
  }
}


// posCubit.sections?[index].inUse == true
//                       ? GestureDetector(
//                           onTap: () {
//                             // ignore: avoid_print
//                             print(
//                               'sectionssss ${posCubit.sections?[index].sectionId}',
//                             );
//                             // fun for filter  item with section id
//                             // posCubit.itemsSection(
//                             //   posCubit.sections?[index].sectionId,
//                             // );
//                           },
//                           child: Container(
//                             constraints: const BoxConstraints(
//                               maxHeight: 100,
//                               maxWidth: 100,
//                               minWidth: 80,
//                             ),
//                             decoration: BoxDecoration(
//                                 color: AppColors.whiteColor,
//                                 shape: BoxShape.rectangle,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   width: 2,
//                                   color: AppColors.lightGreyColor,
//                                 )),
//                             margin: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   'assets/images/soda.png',
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   posCubit.sections?[index].arabicTitle,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.black.withOpacity(0.43),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : const SizedBox();