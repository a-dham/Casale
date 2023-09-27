// ignore_for_file: avoid_print

import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key, required this.data});
  final List? data;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var currentLocal = Intl.getCurrentLocale();
    TextEditingController textForm = TextEditingController();

    return SizedBox(
      height: height * 0.50,
      child: ListView.builder(
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showAlerDialog(
                  context,
                  data![index].inUse,
                  textForm,
                );
              },
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                    color: data![index].inUse == true
                        ? AppColors.whiteColor
                        : AppColors.greyColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightGreyColor,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(5, 5),
                      ),
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 10,
                      color: AppColors.orangeColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    Text(
                      currentLocal == 'ar'
                          ? data![index].arabicTitle.toString()
                          : data![index].englishTitle.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  showAlerDialog(BuildContext context, bool? inUse,
      TextEditingController textEditingController) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: inUse != null
                ? CustomeTextFormField(
                    labelText: 'Enter',
                    suffixIcon: const Icon(Icons.numbers),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                      print(textEditingController.value);
                      Navigator.of(context).pop();
                    },
                    textEditingController: textEditingController,
                    validator: (value) {
                      return null;
                    },
                    onTap: () {},
                    onchanged: (string) {},
                  )
                : const Text('can`t use this payment method'),
          );
        });
  }
}
