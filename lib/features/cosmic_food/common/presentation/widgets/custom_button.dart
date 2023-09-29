import 'package:flutter/material.dart';

/// p - primary
/// s- secondary
/// fS - first secondary
/// sS - second secondary
class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomButton({
    required this.pSizedBoxHeight,
    required this.pSizedBoxWidth,
    required this.fSContainerBorderColor,
    required this.fSContainerColor,
    required this.fSradius,
    required this.textColor,
    required this.fSSizedBoxHeight,
    required this.fSSizedBoxWidth,
    required this.buttonRadius,
    required this.fontWeight,
    required this.buttonTextFontSize,
    required this.buttonText,
    required this.callbackFunction,
  });
  final double pSizedBoxHeight;
  final double pSizedBoxWidth;
  final Color fSContainerBorderColor;
  final Color fSContainerColor;
  final double fSradius;
  final double buttonRadius;
  final FontWeight fontWeight;
  final Color textColor;
  final double fSSizedBoxHeight;
  final double fSSizedBoxWidth;
  final String buttonText;
  final double buttonTextFontSize;
  final void Function() callbackFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: pSizedBoxHeight,
        width: pSizedBoxWidth,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: fSContainerBorderColor,
                  width: 3.0,
                ),
                color: fSContainerColor,
                borderRadius: BorderRadius.circular(fSradius),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: SizedBox(
                  height: fSSizedBoxHeight,
                  width: fSSizedBoxWidth,
                  child: ElevatedButton(
                    onPressed: callbackFunction,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: textColor,
                          fontSize: buttonTextFontSize,
                          fontWeight: fontWeight,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
