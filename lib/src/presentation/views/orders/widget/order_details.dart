import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        toolbarTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        centerTitle: true,
        title: const Text(
          ' Order #25441240',
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Row(),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.red,
          ),
          const Text('item'),
          const Text('item'),
          const Text('item'),
        ],
      ),
    );
  }
}
