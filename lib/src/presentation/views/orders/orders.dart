import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/orders/widget/order_card.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/order_ cubit/order_cubit.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    BlocProvider.of<OrderCubit>(context).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = OrderCubit.get(context);
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
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
            body: TabBarView(
              children: [
                orderCubit.orders!.isEmpty
                    ? const Center(child: CustomeCircularProgress())
                    : OrderList(
                        orders: orderCubit.orders,
                      ),
                const OrderList(
                  orders: [],
                ),
                const OrderList(
                  orders: [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
