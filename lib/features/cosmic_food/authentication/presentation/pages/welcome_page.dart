import 'package:cosmic_food_app/core/layouts/responsive.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/desktop/desktop_welcome_page.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/pages/mobile/mobile_welcome_page.dart';
import 'package:flutter/material.dart';

class UserWelcomePage extends StatelessWidget {
  const UserWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileWelcomePage(),
      desktopBody: DesktopWelcomePage(),
    );
  }
}
