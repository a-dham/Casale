import 'package:casale/generated/l10n.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/data/datasources/end_points.dart';
import 'package:casale/src/presentation/views/customer/customer.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/circular_progress.dart';

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
                children: [
                  Row(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 50,
                          maxWidth: 50,
                        ),
                        child: Image.network(
                          '${EndPoints.assetsUrl}${posCubit.orgModel?.data?.logo}',
                          fit: BoxFit.scaleDown,
                          width: double.infinity,
                          height: 85,
                          errorBuilder: (context, object, stacktrace) {
                            return Image.asset(
                                fit: BoxFit.scaleDown,
                                width: double.infinity,
                                height: 85,
                                'assets/images/error-loading-items.gif');
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const CustomeCircularProgress();
                            }
                          },
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) =>
                                  child,
                        ),
                      ),
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
                                'no title',
                            style: const TextStyle(
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
