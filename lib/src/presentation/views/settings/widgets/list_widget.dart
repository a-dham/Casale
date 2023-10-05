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
    return ListTile(
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
    );
  }
}
