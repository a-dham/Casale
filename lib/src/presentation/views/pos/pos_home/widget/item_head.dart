import 'package:flutter/material.dart';

class ItemsHeader extends StatelessWidget {
  const ItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Coffe Menu'),
        Spacer(),
        Text('12 Items'),
      ],
    );
  }
}
