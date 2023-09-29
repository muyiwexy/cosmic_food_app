import 'package:cosmic_food_app/features/cosmic_food/common/presentation/widgets/custom_button.dart';

import '../../../../../core/utils/colors.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  void signIn(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserSignInPage()),
    );
  }

  void signUp(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => UserSignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary01,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // userSignInButton(size, context),
              signUpNavButton(size, context),
              const SizedBox(
                height: 20,
              ),
              signInNavButton(size, context),
            ],
          ),
        ),
      ),
    );
  }

  CustomButton signInNavButton(Size size, BuildContext context) {
    return CustomButton(
      pSizedBoxHeight: 70,
      pSizedBoxWidth: size.width,
      fSContainerBorderColor: AppColors.secondary01,
      fSContainerColor: AppColors.secondary01,
      fSradius: 20,
      textColor: AppColors.secondary01,
      fSSizedBoxHeight: 55,
      fSSizedBoxWidth: size.width,
      buttonRadius: 20,
      fontWeight: FontWeight.w900,
      buttonTextFontSize: 30,
      buttonText: "SIGN IN",
      callbackFunction: () {
        signIn(context);
      },
    );
  }

  CustomButton signUpNavButton(Size size, BuildContext context) {
    return CustomButton(
      pSizedBoxHeight: 70,
      pSizedBoxWidth: size.width,
      fSContainerBorderColor: AppColors.secondary01,
      fSContainerColor: AppColors.secondary01,
      fSradius: 20,
      textColor: AppColors.secondary01,
      fSSizedBoxHeight: 55,
      fSSizedBoxWidth: size.width,
      buttonRadius: 20,
      fontWeight: FontWeight.w900,
      buttonTextFontSize: 30,
      buttonText: "SIGN UP",
      callbackFunction: () {
        signUp(context);
      },
    );
  }
}
