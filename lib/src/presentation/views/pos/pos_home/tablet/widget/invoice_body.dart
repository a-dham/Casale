import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_invoice.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/presentation/widgets/custome_text_form_field.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    onPressed: () {
                      showAlert(context);
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
    );
  }

// alert dialog for add customer
  void showAlert(BuildContext context) {
    showDialog(
        useSafeArea: true,
        barrierDismissible: true,
        barrierColor: AppColors.orangeColor.withOpacity(0.08),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    '${S.current.add} ${S.current.customer}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                      labelText: S.current.name,
                      suffixIcon: const Icon(Icons.person),
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      textEditingController: null,
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                      labelText: S.current.phone,
                      suffixIcon: const Icon(Icons.phone),
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      textEditingController: null,
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextFormField(
                      labelText: S.current.email,
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: null,
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomeTextButton(
                    childWidget: Text(
                      S.current.add,
                      style: const TextStyle(
                        color: AppColors.orangeColor,
                      ),
                    ),
                    borderwidth: 1,
                    isBorder: BorderStyle.solid,
                    backgroundColor: AppColors.whiteColor,
                    elevation: 1,
                    onPressed: () {},
                    minimumSize: const Size(150, 35),
                    borderRaduis: BorderRadius.circular(10),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
