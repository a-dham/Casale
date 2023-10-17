import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "Customer added",
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}



//