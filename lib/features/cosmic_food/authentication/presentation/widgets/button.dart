import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.callback,
  });
  final String text;
  final Color textColor;
  final double fontSize;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
