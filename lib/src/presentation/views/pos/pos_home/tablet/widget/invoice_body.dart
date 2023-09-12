import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/auth/auth_cubit.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/views/customer/add_customer.dart';
import 'package:casale/src/presentation/views/customer/customer.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {
        if (state is AuthStateSuccess) {
          print('asdadasdasdasd $state');
        }
      },
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/accont_avatar.svg'),
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
                          const Text(
                            'abdelaziz',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        color: Colors.black,
                        icon: const Icon(
                          Icons.notification_add,
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
                        Text(
                          '${S.current.invoice} #1234485',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () async {
                            if (posCubit.customers.isEmpty) {
                              await posCubit.getCustomers().then((value) {
                                Customer().showAlert(context, posCubit);
                              });
                            } else {
                              Customer().showAlert(context, posCubit);
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          label: Text(
                            S.current.cusotmer,
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
