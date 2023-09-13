// ignore_for_file: avoid_print

import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/data/datasources/local/cashe_helper.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_widget.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsInvoice extends StatelessWidget {
  const ItemsInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    PosCubit posCubit = PosCubit.get(context);
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: screenHeight - 460),
              child: ListView.builder(
                  itemCount: posCubit.cart.length,
                  itemBuilder: (context, index) {
                    var itemCart = posCubit.cart[index];
                    double itemTotalprice = itemCart.price * itemCart.quantity;
                    return Dismissible(
                      resizeDuration: const Duration(
                        milliseconds: 850,
                      ),
                      key: UniqueKey(),
                      onDismissed: (_) {
                        posCubit.removeItemFromCart(itemCart);
                      },
                      background: Container(
                        color: Colors.red,
                      ),
                      child: ItemWidget(
                        quantity: itemCart.quantity,
                        itemName: itemCart.title,
                        itemPrice: itemTotalprice.toString(),
                        posCubit: posCubit,
                        itemIndex: itemCart,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    S.current.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${posCubit.totalPrice} ${S.current.saudiaCurrency}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      S.current.tax,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      ' ${posCubit.totalPrice} ${S.current.saudiaCurrency}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Text(
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  '---------------------------------------------------------------------------------------------------------------------------',
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      S.current.total,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${posCubit.totalPrice}  ${S.current.saudiaCurrency}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomeTextButton(
                  childWidget: Text(
                    S.current.invoice,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  borderwidth: 0,
                  isBorder: BorderStyle.none,
                  backgroundColor: AppColors.orangeColor,
                  elevation: 1,
                  onPressed: () async {
                    // posCubit.clearCart();
                    // posCubit.invoiceTotal();
                    CacheHelper.removeData(key: 'sysac');
                    // Navigator.pushNamed(context, Routes.payment);

                    // posCubit.getOrgData();
                    // posCubit.addCustomer(
                    //     firstName: 'bcvbcvbcv',
                    //     lastName: 'cvbcvb',
                    //     phoneNumber: '345345345');
                  },
                  minimumSize: Size(
                    200,
                    screenHeight * 0.06,
                  ),
                  borderRaduis: BorderRadius.circular(10),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
