import 'package:cosmic_food_app/core/layouts/responsive.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/desktop/desktop_signup_page.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/mobile/mobile_signup_page.dart';
import 'package:flutter/material.dart';

class UserSignUpPage extends StatelessWidget {
  const UserSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: MobileUserSignUpPage(),
        desktopBody: const DesktopUserSignUpPage());
  }
}
