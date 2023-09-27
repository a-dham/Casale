import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/payment_cubit/payment_cubit.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/payment_method.dart';

// ignore: must_be_immutable
class Payment extends StatelessWidget {
  Payment({super.key});
  List? data = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);
        return BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is GetPaymethodsstateSuccess) {
              // data = paymentCubit.paymethodModel?.data;
            }
          },
          builder: (context, state) {
            PaymentCubit paymentCubit = PaymentCubit.get(context);
            if (state is GetPaymethodsstateSuccess) {
              data = paymentCubit.paymethodModel?.data;
            }
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(S.current.paymentWays),
                centerTitle: true,
                backgroundColor: AppColors.orangeColor,
                elevation: 1,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    data!.isNotEmpty
                        ? PaymentMethods(data: data)
                        : const CustomeCircularProgress(),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(4, 4),
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.2))
                          ]),
                      child: Row(
                        children: [
                          const Text(
                            'ٌRemaining to pay',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${posCubit.remainingToPay.toStringAsFixed(2)} SAR',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomeTextButton(
                        childWidget: const Text(
                          'pay',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                        borderwidth: 1,
                        isBorder: BorderStyle.none,
                        backgroundColor: posCubit.remainingToPay == 0
                            ? AppColors.orangeColor
                            : AppColors.lightGreyColor,
                        elevation: 1,
                        onPressed: () {
                          posCubit.remainingToPay == 0
                              ? _showMyDialog(context)
                              : null;

                          paymentCubit.getPaymethods();
                        },
                        minimumSize: const Size(double.infinity, 50),
                        borderRaduis: BorderRadius.circular(5)),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(S.current.printingAlert),
          actions: <Widget>[
            TextButton(
              child: Text(
                S.current.cancel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.current.print),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.print);
              },
            ),
          ],
        );
      },
    );
  }
}
