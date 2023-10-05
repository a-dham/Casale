import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/orders/widget/order_card.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.orders,
            style: const TextStyle(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: AppColors.whiteColor,
          bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
              unselectedLabelColor: AppColors.orangeColor,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.orangeColor,
              ),
              tabs: [
                Tab(
                  text: S.current.all,
                ),
                Tab(
                  text: S.current.active,
                ),
                Tab(
                  text: S.current.canceld,
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            OrderList(),
            OrderList(),
            OrderList(),
          ],
        ),
      ),
    );
  }
}
