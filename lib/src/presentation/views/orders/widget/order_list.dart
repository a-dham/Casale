// import 'package:casale/src/features/presentation/Orders/widget/order_card.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/domain/models/order_model.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

//
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final Data order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        color: AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(),
        height: 40,
        child: Card(
            semanticContainer: true,
            elevation: 2,
            child: Table(
              children: [
                TableRow(children: [
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, Routes.orderDetails);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: textWidget(
                          order.orderNumber.toString(), FontWeight.bold),
                    ),
                  ),
                  textWidget(order.customerTitle.toString(), FontWeight.normal),
                  textWidget(order.orderdate.toString(), FontWeight.normal),
                  textWidget(
                      order.totalsWithtax != null
                          ? order.totalsWithtax.toString()
                          : '0.00',
                      FontWeight.normal),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.print,
                      );
                    },
                    icon: const Icon(
                      Icons.print,
                      color: AppColors.orangeColor,
                    ),
                  ),
                ])
              ],
            )),
      ),
    );
  }

  // Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [

  //           ],
  //         ),

  textWidget(
    String value,
    FontWeight fontWeight,
  ) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 100,
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
