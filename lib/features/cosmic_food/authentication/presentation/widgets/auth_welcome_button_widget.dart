import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/widgets/buttons.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({
    super.key,
    required this.size,
    required this.callback,
    required this.text,
  });

  final Size size;
  final void Function() callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: AppColors.secondary01,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.secondary01,
            ),
          ),
          SizedBox(
            height: 60,
            width: size.width,
            child: Buttons(
              buttonBorderRadius: 15,
              callbackFunction: callback,
              text: text,
              textfontWeight: FontWeight.w900,
              textcolor: AppColors.secondary01,
              textfontsize: 25.sp,
              buttonColors: AppColors.primary02,
            ),
          ),
        ],
      ),
    );
  }
}
