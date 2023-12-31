import 'package:casale/src/domain/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../cubits/pos_cubit/pos_cubit.dart';
import '../../../../utils/constant/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});
  // ignore: prefer_typing_uninitialized_variables
  final order;
  @override
  Widget build(BuildContext context) {
    Data invoice = order as Data;
    return BlocConsumer<PosCubit, PosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0XFFf4f4f4),
          appBar: AppBar(
            backgroundColor: const Color(0XFFf4f4f4),
            foregroundColor: Colors.black,
            toolbarTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            centerTitle: true,
            actions: const [],
            title: Text(
              ' ${S.current.orderNumber} # ${invoice.orderNumber}',
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              const Row(),
              invoice.totalItems != null
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: invoice.totalItems != null
                            ? int.parse(invoice.totalItems!)
                            : 0,
                        itemBuilder: (builder, context) {
                          return Container(
                            constraints: const BoxConstraints(
                              maxHeight: 60,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.whiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0XFFf4f4f4),
                                    offset: Offset(5, 5),
                                    spreadRadius: 3,
                                    blurStyle: BlurStyle.normal,
                                  )
                                ]),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/error-loading-items.gif',
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'قهوة ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text('10 ${S.current.saudiaCurrency}'),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      alignment: Alignment.center,
                                      style: IconButton.styleFrom(),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.minimize_outlined,
                                        size: 20,
                                      ),
                                    ),
                                    const Text(
                                      '02',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      alignment: Alignment.center,
                                      style: IconButton.styleFrom(),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (builder, context) {
                          return const Divider(
                            color: AppColors.whiteColor,
                          );
                        },
                      ),
                    )
                  : const Text('There is no Items yet'),
              const Text(
                '------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
                maxLines: 1,
              ),
              Text(
                '${S.current.totalPriceWithVat}  :  ${invoice.totalsWithtax ?? 00.0} ${S.current.saudiaCurrency}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
