import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.size,
    required this.hintText,
    required this.fillColor,
    required this.isFilled,
    required this.textFieldBorderColors,
    required this.textColors,
    required this.fontSize,
    required this.textEditingController,
  });

  final Size size;
  final String hintText;
  final Color fillColor;
  final bool isFilled;
  final Color textFieldBorderColors;
  final Color textColors;
  final double fontSize;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: isFilled,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: textFieldBorderColors, width: 3.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: textFieldBorderColors, width: 3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: textFieldBorderColors, width: 3.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      style: TextStyle(
        fontFamily: "Poppins",
        color: textColors,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
      ),
    );
  }
}
