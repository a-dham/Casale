import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../utils/constant/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          ' Order #25441240',
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Row(),
          Expanded(
            child: ListView.separated(
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
                itemCount: 10),
          ),
          const Text(
            '------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
            maxLines: 1,
          ),
          Text(
            '${S.current.totalPriceWithVat} 50 ${S.current.saudiaCurrency}',
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
  }
}
