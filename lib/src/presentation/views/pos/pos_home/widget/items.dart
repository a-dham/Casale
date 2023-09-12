import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
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
        return Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width >= 600 ? 4 : 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 150,
              ),
              itemCount: posCubit.items.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = posCubit.items[index];
                return GestureDetector(
                  onTap: () {
                    posCubit.addItemTocart(item);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: AppColors.lightGreyColor,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/item.png',
                          fit: BoxFit.scaleDown,
                          width: double.infinity,
                          height: 85,
                        ),
                        const Spacer(),
                        Text(
                          style: const TextStyle(
                              color: Color(0xff12141E),
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis),
                          item.title,
                        ),
                        Text(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          item.price.toString(),
                        ),
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