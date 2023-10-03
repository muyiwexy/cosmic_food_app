import 'package:cosmic_food_app/core/utils/colors.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/auth_welcome_button_widget.dart';
import '../signup_page.dart';

class MobileWelcomePage extends StatelessWidget {
  const MobileWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary01,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WelcomeButtons(
                    size: size,
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UserSignUpPage()),
                      );
                    },
                    text: "Sign Up",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  WelcomeButtons(
                      size: size,
                      callback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const UserSignInPage(),
                          ),
                        );
                      },
                      text: "Sign In"),
                ],
              ))
        ],
      ),
    );
  }
}
