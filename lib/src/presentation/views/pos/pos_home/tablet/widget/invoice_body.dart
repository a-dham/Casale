import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/customer/customer.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constant/app_colors.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            S.current.pos,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.44),
                            ),
                          ),
                          Text(
                            posCubit.loginModel?.data?.accountTitle
                                    .toString() ??
                                '........',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Badge(
                        smallSize: 5,
                        alignment: Alignment.bottomLeft,
                        label: Text(posCubit.cart.length.toString()),
                        isLabelVisible: true,
                        backgroundColor: Colors.green[900],
                        child: const Icon(
                          Icons.shopping_basket_outlined,
                          color: AppColors.orangeColor,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.04),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () async {
                            if (posCubit.customers!.isEmpty) {
                              await posCubit.getCustomers().then((value) {
                                Customer().showAlert(context, posCubit);
                              });
                            } else {
                              Customer().showAlert(context, posCubit);
                            }
                          },
                          icon: Icon(
                            posCubit.customerName != null
                                ? Icons.check
                                : Icons.add,
                            color: Colors.black,
                          ),
                          label: Text(
                            posCubit.customerName != null
                                ? posCubit.customerName.toString()
                                : S.current.cusotmer,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const ItemsInvoice(),
            ],
          ),
        );
      },
    );
  }
}
