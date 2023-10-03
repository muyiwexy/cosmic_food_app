import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/widgets/textfield.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: AppColors.secondary01,
                ),
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary02),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: AppTextField(
                controller: controller,
                fillColor: AppColors.primary02,
                isFilled: true,
                hintText: hintText,
                textFieldBorderColors: AppColors.secondary01,
                textColors: AppColors.secondary01,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}
