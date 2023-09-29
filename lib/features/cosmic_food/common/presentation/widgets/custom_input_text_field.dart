import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import 'input_text_field.dart';

class CustomInputField extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final String hintText;

  // ignore: use_key_in_widget_constructors
  const CustomInputField({
    required this.size,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3.0,
                color: AppColors.secondary01,
              ),
              borderRadius: BorderRadius.circular(25),
              color: AppColors.primary02,
            ),
          ),
          SizedBox(
            height: 55,
            width: size.width,
            child: InputText(
              size: size,
              textEditingController: controller,
              fillColor: AppColors.primary02,
              isFilled: true,
              fontSize: 20,
              hintText: hintText,
              textColors: AppColors.secondary01,
              textFieldBorderColors: AppColors.secondary01,
            ),
          ),
        ],
      ),
    );
  }
}
