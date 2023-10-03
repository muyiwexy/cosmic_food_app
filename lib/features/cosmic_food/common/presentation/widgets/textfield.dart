import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.fillColor,
    required this.isFilled,
    required this.hintText,
    required this.textFieldBorderColors,
    required this.textColors,
    required this.fontSize,
  });

  final TextEditingController controller;
  final Color fillColor;
  final bool isFilled;
  final String hintText;
  final Color textFieldBorderColors;
  final Color textColors;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: isFilled,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
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
