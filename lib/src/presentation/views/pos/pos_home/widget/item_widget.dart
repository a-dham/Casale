import 'package:casale/src/domain/models/products_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/app_colors.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.item});
  final Data item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        border: Border.all(
          width: 2,
          color: AppColors.lightGreyColor,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
              fit: BoxFit.scaleDown,
              width: double.infinity,
              height: 85,
              'assets/images/item.png'),
          // Image.network(
          //   '${EndPoints.assetsUrl}${item.image}',
          //   fit: BoxFit.scaleDown,
          //   width: double.infinity,
          //   height: 85,
          //   errorBuilder: (context, object, stacktrace) {
          //     return Image.asset(
          //         fit: BoxFit.scaleDown,
          //         width: double.infinity,
          //         height: 85,
          //         'assets/images/error-loading-items.gif');
          //   },
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) {
          //       return child;
          //     } else {
          //       return const CustomeCircularProgress();
          //     }
          //   },
          //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          //       child,
          // ),
          const Spacer(),
          Text(
            style: const TextStyle(
                color: Color(0xff12141E),
                fontSize: 14,
                overflow: TextOverflow.ellipsis),
            item.arabicTitle ?? '',
          ),
          Text(
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              // ignore: prefer_is_empty
              item.units.length == 0
                  ? 'No Price !!'
                  : item.units[0].unitPrice ?? ''),
          const Spacer(),
        ],
      ),
    );
  }
}
