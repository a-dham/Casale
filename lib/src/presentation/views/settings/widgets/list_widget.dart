import 'package:casale/src/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
        BoxShadow(
            blurRadius: 3,
            offset: const Offset(2, 2),
            spreadRadius: 3,
            color: Colors.black.withOpacity(
              0.3,
            ))
      ]),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          iconData,
        ),
      ),
    );
  }
}
