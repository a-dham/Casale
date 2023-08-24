import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.35,
          ),
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, lenght) {
            return GestureDetector(
              onTap: () {},
              onLongPress: () => Navigator.of(context).pushNamed(Routes.extra),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: AppColors.lightGreyColor,
                    )),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: AppColors.lightGreyColor,
                          )),
                      child: Image.asset(
                        'assets/images/item.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 85,
                      ),
                    ),
                    const Text(
                      style: TextStyle(
                          color: Color(0xff12141E),
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis),
                      'spresso cafee',
                    ),
                    const Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      '\n 10 SAR',
                    ),
                  ],
                ),
              ),
            );
          }),
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