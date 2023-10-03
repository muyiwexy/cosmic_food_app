import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final double textfontsize;
  final Color textcolor;
  final FontWeight textfontWeight;
  final void Function() callbackFunction;
  final double? buttonBorderRadius;
  final Color? buttonColors;
  const Buttons({
    super.key,
    required this.callbackFunction,
    this.buttonBorderRadius = 20,
    this.buttonColors = Colors.transparent,
    required this.text,
    required this.textfontWeight,
    required this.textcolor,
    required this.textfontsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callbackFunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius!)),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: textfontsize,
              fontStyle: FontStyle.normal,
              fontWeight: textfontWeight,
              color: textcolor),
        ),
      ),
    );
  }
}
