import 'package:cosmic_food_app/core/layouts/responsive.dart';
import 'package:cosmic_food_app/features/cosmic_food/home/presentation/pages/desktop/desktop_home_page.dart';
import 'package:cosmic_food_app/features/cosmic_food/home/presentation/pages/mobile/mobile_home_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileHomePage(),
      desktopBody: const DesktopHomePage(),
    );
  }
}
