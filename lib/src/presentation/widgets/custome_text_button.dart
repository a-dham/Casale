import 'package:flutter/material.dart';

class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({
    super.key,
    required this.childWidget,
    required this.borderwidth,
    required this.isBorder,
    required this.backgroundColor,
    required this.elevation,
    required this.onPressed,
    required this.minimumSize,
    required this.borderRaduis,
  });
  final Widget childWidget;
  final double borderwidth;
  final BorderStyle isBorder;
  final Color backgroundColor;
  final double elevation;
  final Size? minimumSize;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRaduis;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: borderRaduis),
        elevation: elevation,
        minimumSize: minimumSize,
        backgroundColor: backgroundColor,
        side: BorderSide(
          color: Colors.orange,
          width: borderwidth,
          style: isBorder,
        ),
      ),
      child: childWidget,
    );
  }
}
