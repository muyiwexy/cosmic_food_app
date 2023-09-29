import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CustomSubmitButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomSubmitButton({required this.callbackFunction});
  final void Function() callbackFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 70,
        width: 120,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.secondary01,
                  width: 3.0,
                ),
                color: AppColors.secondary01,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: SizedBox(
                height: 55,
                width: 120,
                child: Button(
                  callback: callbackFunction,
                  text: "Submit",
                  textColor: AppColors.secondary01,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
