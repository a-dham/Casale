// ignore_for_file: avoid_print

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
    required this.posCubit,
    // required this.itemIndex,
  });
  final String itemName;
  final String itemPrice;
  final int quantity;
  final PosCubit posCubit;
  // final ItemModel itemIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              constraints: const BoxConstraints(
                maxHeight: 60,
                minWidth: 50,
              ),
              child: Image.asset('assets/images/item.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.extra);
                    },
                    child: Text(S.current.note),
                  ),
                  GestureDetector(
                    onTap: () => showQuantityDialog(context, posCubit),
                    child: Text(
                      'X $quantity',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '$itemPrice ${S.current.saudiaCurrency}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ]);
  }

  showQuantityDialog(context, PosCubit posCubit) {
    showDialog(
        context: context,
        barrierColor: AppColors.orangeColor.withOpacity(0.08),
        builder: (builder) {
          return AlertDialog(
              content: Row(
            children: [
              IconButton(
                onPressed: () {
                  // posCubit.addItemTocart(item);
                },
                icon: const Icon(
                  Icons.add,
                  color: AppColors.orangeColor,
                  size: 33,
                ),
              ),
              const Spacer(),
              Container(
                constraints: const BoxConstraints(maxWidth: 100),
                child: TextField(
                  cursorColor: AppColors.orangeColor,
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                    // item.quantity = value as int;
                    // print('qqq==${item.quantity}');
                    print(value);
                  },
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // posCubit.decresQuantityFromCart(item);
                },
                icon: const Icon(
                  Icons.minimize,
                  color: AppColors.orangeColor,
                  size: 33,
                ),
              ),
            ],
          ));
        });
  }
}
