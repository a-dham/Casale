// import 'package:casale/src/features/presentation/Orders/widget/order_card.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

//
class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.orderDetails);
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        color: AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(),
        height: 40,
        child: Card(
          semanticContainer: true,
          surfaceTintColor: Colors.red,
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textWidget('#02125144', FontWeight.bold),
              textWidget('Adham', FontWeight.normal),
              textWidget('10/10/2023 10:05', FontWeight.normal),
              textWidget('Total:250 SAR', FontWeight.normal),
              const Icon(
                Icons.print,
                color: AppColors.orangeColor,
              ),
              const Icon(
                Icons.edit,
                color: AppColors.orangeColor,
              ),
              const Icon(
                Icons.delete,
                color: AppColors.orangeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  textWidget(
    String value,
    FontWeight fontWeight,
  ) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 80,
      ),
      child: Text(
        value,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

//
