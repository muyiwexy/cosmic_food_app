import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../common/presentation/widgets/text_types.dart';
import '../../provider/user_registration_provider.dart';
import '../../widgets/auth_submit_button.dart';
import '../../widgets/auth_text_form_field_widget.dart';

class MobileUserSignUpPage extends StatelessWidget {
  MobileUserSignUpPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRegProvider>(
        builder: (context, userRegNotifier, widget) {
      return Stack(
        children: [
          Scaffold(
              backgroundColor: AppColors.primary01,
              appBar: AppBar(
                backgroundColor: AppColors.primary01,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: -0.1,
                      child: const TextHeader(
                        text: "SIGN UP",
                        color: AppColors.secondary01,
                        fontsize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        InputField(
                          controller: nameController,
                          hintText: "Enter Name",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                            controller: emailController,
                            hintText: "Enter E-mail"),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                          controller: passwordController,
                          hintText: "Enter Password",
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AuthSubmitButton(
                          callback: () async {
                            await userRegNotifier.signUpUser(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          if (userRegNotifier.isLoading)
            Positioned.fill(
              child: Container(
                color: AppColors.secondary01.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondary01,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
