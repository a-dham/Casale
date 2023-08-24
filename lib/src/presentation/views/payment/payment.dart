import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/payment_method.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            Text('Payment Ways'),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                textAlign: TextAlign.center,
                'Currency',
              ),
            ),
          ],
        ),
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
            const PaymentMethods(),
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
              child: const Row(
                children: [
                  Text(
                    'ٌRemaining to pay',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Spacer(),
                  Text(
                    '250 SAR',
                    style: TextStyle(
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
                backgroundColor: AppColors.orangeColor,
                elevation: 1,
                onPressed: () {
                  _showMyDialog(context);
                },
                minimumSize: const Size(double.infinity, 50),
                borderRaduis: BorderRadius.circular(5)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payed Done'),
          content: const Text('Would you like to Print this?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Print'),
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
