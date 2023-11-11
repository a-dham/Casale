// ignore_for_file: avoid_print

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/domain/models/products_model.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constant/tofixed.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.posCubit,
    required this.item,
    required this.quantity,
  });
  final int quantity;
  final PosCubit posCubit;
  final Data item;

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double price = double.parse(item.units[item.selectedUnit].unitPrice!);
    item.vat = price * (item.tax! / 100);
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      posCubit.removeItemFromCart(item);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        actionOverflowThreshold: 1,
                        duration: const Duration(milliseconds: 500),
                        backgroundColor: Colors.red,
                        content: Center(
                          child: Text(S.current.itemDeleted),
                        ),
                      ));
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.orangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    item.arabicTitle.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // ElevatedButton(
                  //     onPressed: () {
                  //       print('adham');
                  //     },
                  //     child: Text('print')),
                  DropdownButton(
                    elevation: 0,
                    value: item.units[item.selectedUnit].unitId,
                    focusColor: AppColors.orangeColor,
                    items: item.units.map<DropdownMenuItem<dynamic>>((value) {
                      return DropdownMenuItem<dynamic>(
                        value: value.unitId,
                        child: Text(value.title.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print('value IS  $value');
                      posCubit.changeUnit(item, int.parse(value));
                      print('---------------------------');
                      // print('INDEX IS  ${posCubit.indexValue}');
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showQuantityDialog(context, posCubit, item);
                    },
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
                    price.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    item.vat!.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${toFixed(item.totalPriceWithVat!)} ${S.current.saudiaCurrency}',
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

  showQuantityDialog(context, PosCubit posCubit, item) {
    showDialog(
        context: context,
        barrierColor: AppColors.orangeColor.withOpacity(0.08),
        builder: (builder) {
          return AlertDialog(
              content: Row(
            children: [
              IconButton(
                onPressed: () {
                  posCubit.addItemTocart(item);
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
                child: CustomeTextFormField(
                  labelText: 'add inputs',
                  suffixIcon: null,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  textEditingController: textEditingController,
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {
                    item.quantity = int.parse(value);
                    posCubit.itemTotalWithVat(item, item);
                    Navigator.pop(context);
                  },
                  onchanged: null,
                  onTap: null,
                  inputFormamatters: const [],
                ),
              ),
              // Container(
              //   constraints: const BoxConstraints(maxWidth: 100),
              //   child: TextField(
              //     cursorColor: AppColors.orangeColor,
              //     keyboardType: TextInputType.number,
              //     onSubmitted: (value) {
              //       print(value);
              //     },
              //   ),
              // ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  posCubit.decresQuantityFromCart(item);
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
