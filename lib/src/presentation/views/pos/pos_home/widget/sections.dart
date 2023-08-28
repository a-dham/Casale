import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, length) {
            return Container(
              height: 100,
              width: 90,
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
                    'All Sections',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.43),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
