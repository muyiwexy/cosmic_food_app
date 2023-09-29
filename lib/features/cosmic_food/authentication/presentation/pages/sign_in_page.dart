import 'package:cosmic_food_app/core/utils/colors.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/presentation/provider/user_registration_provider.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/pages/home_pages.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/custom_submit_button.dart';
import '../widgets/text_types.dart';

class UserSignInPage extends StatelessWidget {
  UserSignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // UserRegProvider userRegProvider = context.watch<UserRegProvider>();
    final size = MediaQuery.of(context).size;
    return Consumer2<UserRegProvider, CommonProvider>(
        builder: (BuildContext context, userNotifier, commonNotifier, widget) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.primary01,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.primary01,
            ),
            body: _ui(userNotifier, commonNotifier, size, context),
          ),
          if (userNotifier.isLoading)
            Positioned.fill(
              child: Container(
                color: AppColors.secondary01.withOpacity(0.3),
                child: const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.secondary01),
                ),
              ),
            ),
        ],
      );
    });
  }

  _ui(UserRegProvider userNotifer, CommonProvider commonNotifier, Size size,
      BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -0.1,
              child: const TextHeader(
                text: "SIGN IN",
                color: AppColors.secondary01,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              size: size,
              controller: emailController,
              hintText: "ENTER E-MAIL",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              size: size,
              controller: passwordController,
              hintText: "ENTER PASSWORD",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomSubmitButton(
              callbackFunction: () async {
                await userNotifer.signInUser(
                    emailController.text, passwordController.text, context);

                await Future.delayed(const Duration(milliseconds: 100),
                    () async {
                  await commonNotifier.getSignedUser(context);
                });

                await Future.delayed(const Duration(milliseconds: 100),
                    () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                });

                // clear controllers
                emailController.clear();
                passwordController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
