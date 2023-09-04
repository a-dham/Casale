import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });
  final String itemName;
  final String itemPrice;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/soda.png',
          ),
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
                    onPressed: () {},
                    child: Text(S.current.note),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(Routes.extra),
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
}
