import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/cubits/pos_cubit/pos_cubit.dart';
import 'package:casale/src/presentation/widgets/circular_progress.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/payment_method.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List? data = [];

  @override
  void initState() {
    BlocProvider.of<PosCubit>(context).getPaymethods();
    BlocProvider.of<PosCubit>(context).remaining = 0.00;
    BlocProvider.of<PosCubit>(context).invoiceTotal();
    BlocProvider.of<PosCubit>(context).paymethods.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        PosCubit posCubit = PosCubit.get(context);
        if (state is GetPaymethodsstateSuccess) {
          data = posCubit.paymethodModel?.data;
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
                    ? PaymentMethods(
                        data: data,
                        posCubit: posCubit,
                      )
                    : const CustomeCircularProgress(),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration:
                      BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                    BoxShadow(
                        offset: const Offset(4, 4),
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.2))
                  ]),
                  child: Row(
                    children: [
                      Text(
                        S.current.requirePay,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${posCubit.requiredToPaid.toStringAsFixed(2)} ${S.current.saudiaCurrency}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration:
                      BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                    BoxShadow(
                        offset: const Offset(4, 4),
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.2))
                  ]),
                  child: Row(
                    children: [
                      Text(
                        S.current.remainingClient,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${posCubit.remaining.toStringAsFixed(2)} ${S.current.saudiaCurrency}',
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
                    backgroundColor: posCubit.requiredToPaid == 0
                        ? AppColors.orangeColor
                        : AppColors.lightGreyColor,
                    elevation: 1,
                    onPressed: () {
                      posCubit.requiredToPaid == 0
                          ? _showMyDialog(context, posCubit)
                          : null;
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
  }

  Future<void> _showMyDialog(context, PosCubit posCubit) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            S.current.printingAlert,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                S.current.newOrder,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              onPressed: () async {
                // save order -> clear cart ->  navigate to home .
                await posCubit.newOrder();
                posCubit.clearCart();
                posCubit.remaining = 0.00;
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.bottomNavigation,
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: Text(
                S.current.edit,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                S.current.print,
                style: const TextStyle(
                  color: AppColors.orangeColor,
                ),
              ),
              onPressed: () async {
                // Save order -> get order data -> send data to print pay
                await posCubit.newOrder();

                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.print,
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
