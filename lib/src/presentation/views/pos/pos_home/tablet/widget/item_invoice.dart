import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
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
              constraints: BoxConstraints(
                maxHeight: screenHeight - 400,
                maxWidth: double.infinity,
              ),
              child: ListView.separated(
                  separatorBuilder: (context, inedx) {
                    return const Divider(
                      thickness: 2,
                      color: AppColors.orangeColor,
                    );
                  },
                  itemCount: posCubit.cart.length,
                  itemBuilder: (context, index) {
                    var item = posCubit.cart[index];
                    //                 ScaffoldMessenger.of(context)
                    // .showSnackBar(SnackBar(content: Text('$item dismissed')));
                    // posCubit.removeItemFromCart(item);

                    return ItemWidget(
                      item: item,
                      quantity: item.quantity,
                      posCubit: posCubit,
                    );
                  }),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
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
                      '${posCubit.totalorderWithVat.toStringAsFixed(2)}  ${S.current.saudiaCurrency}',
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
                  backgroundColor: posCubit.totalorderWithVat == 0
                      ? AppColors.lightGreyColor
                      : AppColors.orangeColor,
                  elevation: 1,
                  onPressed: () async {
                    posCubit.totalorderWithVat == 0
                        ? null
                        : posCubit.getPaymethods().then(Navigator.pushNamed(
                              context,
                              Routes.payment,
                            ));
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
