import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/widgets/buttons.dart';

class AuthSubmitButton extends StatelessWidget {
  final void Function() callback;
  const AuthSubmitButton({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 80,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3.0,
                color: AppColors.secondary01,
              ),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondary01,
            ),
          ),
          SizedBox(
            height: 70,
            width: 200,
            child: Buttons(
              buttonBorderRadius: 15,
              buttonColors: AppColors.primary02,
              callbackFunction: callback,
              text: "Submit",
              textfontWeight: FontWeight.w900,
              textcolor: AppColors.secondary01,
              textfontsize: 20,
            ),
          )
        ],
      ),
    );
  }
}
