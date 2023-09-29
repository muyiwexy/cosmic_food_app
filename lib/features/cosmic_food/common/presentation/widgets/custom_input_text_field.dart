import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final double pSizedBoxHeight;
  final Size size;
  final Color fSContainerBorderColor;
  final Color fSContainerColor;
  final double fSSizedBoxHeight;
  final Color fillColor;
  final Color textFieldBorderColors;
  final Color textColors;
  final bool isFilled;
  final double fontSize;
  final TextEditingController controller;
  final String hintText;

  // ignore: use_key_in_widget_constructors
  const CustomInputField({
    required this.pSizedBoxHeight,
    required this.size,
    required this.fSContainerBorderColor,
    required this.fSContainerColor,
    required this.fSSizedBoxHeight,
    required this.controller,
    required this.hintText,
    required this.isFilled,
    required this.fontSize,
    required this.fillColor,
    required this.textFieldBorderColors,
    required this.textColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: pSizedBoxHeight,
      width: size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3.0,
                color: fSContainerBorderColor,
              ),
              borderRadius: BorderRadius.circular(25),
              color: fSContainerColor,
            ),
          ),
          SizedBox(
              height: fSSizedBoxHeight,
              width: size.width,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: isFilled,
                  hintText: hintText,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: textFieldBorderColors, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: textFieldBorderColors, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: textFieldBorderColors, width: 3.0),
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
              )),
        ],
      ),
    );
  }
}
