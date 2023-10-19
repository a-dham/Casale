import 'package:flutter/material.dart';

import '../../utils/constant/app_colors.dart';

class CustomeAlertDialog extends StatelessWidget {
  const CustomeAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> showMyDialog({
    required BuildContext context,
    required String textContent,
    required String textCancel,
    required VoidCallback onTapCancel,
    required Widget acceptWidget,
    required VoidCallback onTapAccept,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            textContent,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onTapCancel,
              child: Text(
                textCancel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onTapAccept,
              child: acceptWidget,
            ),
          ],
        );
      },
    );
  }
}
