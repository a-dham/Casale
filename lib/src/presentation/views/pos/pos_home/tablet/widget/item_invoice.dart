import 'package:casale/generated/l10n.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_widget.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ItemsInvoice extends StatelessWidget {
  const ItemsInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.5,
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, lenght) {
                return const ItemWidget();
              }),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Row(
          children: [
            Text(
              S.current.price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Text(
              ' 30 ${S.current.saudiaCurrency}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              S.current.afterTax,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Text(
              ' 80 ${S.current.saudiaCurrency}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
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
              ' 50 ${S.current.saudiaCurrency} ',
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
          backgroundColor: AppColors.orangeColor,
          elevation: 1,
          onPressed: () async {
            // Navigator.pushNamed(context, Routes.payment);
          },
          minimumSize: Size(
            200,
            screenHeight * 0.06,
          ),
          borderRaduis: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
