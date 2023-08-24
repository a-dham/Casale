import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.50,
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, length) {
            return Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              decoration:
                  BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                BoxShadow(
                  color: AppColors.lightGreyColor,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(5, 5),
                ),
              ]),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 10,
                    color: AppColors.orangeColor,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  const Text(
                    'Hunger Station Future',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
