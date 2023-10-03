import 'package:cosmic_food_app/core/layouts/responsive.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/desktop/desktop_signin_page.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/mobile/mobile_signin_page.dart';
import 'package:flutter/material.dart';

class UserSignInPage extends StatelessWidget {
  const UserSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileUserSignInPage(),
      desktopBody: const DesktopUserSignInPage(),
    );
  }
}
