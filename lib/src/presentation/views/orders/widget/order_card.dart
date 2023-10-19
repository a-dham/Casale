import 'package:casale/src/presentation/views/orders/widget/order_list.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orders});
  final List? orders;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderCard(
          order: orders?[index],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 0.5,
          color: AppColors.greyColor,
          height: 1,
        );
      },
      itemCount: orders!.length,
    );
  }
}
