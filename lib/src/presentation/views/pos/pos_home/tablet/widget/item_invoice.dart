import 'package:casale/generated/l10n.dart';
import 'package:casale/src/config/routes/app_router.dart';
import 'package:casale/src/presentation/views/pos/pos_home/tablet/widget/item_widget.dart';
import 'package:casale/src/presentation/widgets/custome_text_button.dart';
import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ItemsInvoice extends StatelessWidget {
  const ItemsInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, lenght) {
                return const ItemWidget();
              }),
        ),
        Row(
          children: [
            Text(S.current.price),
            const Spacer(),
            const Text(' 30 ر.س'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(S.current.afterTax),
            const Spacer(),
            const Text(' 80 ر.س'),
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
            Text(S.current.total),
            const Spacer(),
            const Text(' 50 ر.س'),
          ],
        ),
        CustomeTextButton(
          childWidget: Text(
            S.current.payment,
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
          onPressed: () {
            Navigator.pushNamed(context, Routes.payment);
          },
          minimumSize: const Size(200, 20),
          borderRaduis: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
