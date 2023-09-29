import '../../../../../core/utils/colors.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';

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
              userSignInButton(size, context),
              const SizedBox(
                height: 20,
              ),
              userSignUpButton(size, context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox userSignUpButton(Size size, BuildContext context) {
    return SizedBox(
      height: 70,
      width: size.width,
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
              width: size.width,
              child: Button(
                callback: () {
                  signUp(context);
                },
                text: "Sign Up",
                textColor: AppColors.secondary01,
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox userSignInButton(Size size, BuildContext context) {
    return SizedBox(
      height: 70,
      width: size.width,
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
              width: size.width,
              child: Button(
                callback: () {
                  signIn(context);
                },
                text: "Sign In",
                textColor: AppColors.secondary01,
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
