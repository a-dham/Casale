// import 'package:casale/src/features/presentation/Orders/widget/order_card.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

//
class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.symmetric(),
      height: 40,
      child: const Card(
        semanticContainer: true,
        surfaceTintColor: Colors.red,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('#02125144'),
            Text('10/10/2023'),
            Text('Total:250 SAR'),
            // Icon(
            //   Icons.print,
            //   color: AppColors.orangeColor,
            // ),
          ],
        ),
      ),
    );
  }
}

//
class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, length) {
        return const OrderCard();
      },
      separatorBuilder: (context, lenght) {
        return const Divider(
          thickness: 0.5,
          color: AppColors.greyColor,
          height: 1,
        );
      },
      itemCount: 100,
    );
  }
}
