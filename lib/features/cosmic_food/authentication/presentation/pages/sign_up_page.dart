import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/colors.dart';
import '../provider/user_registration_provider.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/custom_submit_button.dart';
import '../widgets/text_types.dart';

class UserSignUpPage extends StatelessWidget {
  UserSignUpPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UserRegProvider userRegProvider = context.watch<UserRegProvider>();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.primary01,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primary01,
          ),
          body: _ui(userRegProvider, size, context),
        ),
        if (userRegProvider.isLoading)
          Positioned.fill(
              child: Container(
            color: AppColors.secondary01.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.secondary01),
            ),
          )),
      ],
    );
  }

  _ui(UserRegProvider userRegProvider, Size size, BuildContext context) {
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
                text: "SIGN UP",
                color: AppColors.secondary01,
              ),
            ),
            const SizedBox(height: 20),
            CustomInputField(
              size: size,
              controller: nameController,
              hintText: "ENTER NAME",
            ),
            const SizedBox(height: 20),
            CustomInputField(
              size: size,
              controller: emailController,
              hintText: "ENTER E-MAIL",
            ),
            const SizedBox(height: 20),
            CustomInputField(
              size: size,
              controller: passwordController,
              hintText: "ENTER PASSWORD",
            ),
            const SizedBox(height: 30),
            CustomSubmitButton(
              callbackFunction: () async {
                // this call initiates user sign up from the repository through the ChangeNotifier class
                await userRegProvider.signUpUser(emailController.text,
                    passwordController.text, nameController.text, context);

                // clear text controllers
                nameController.clear();
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

// showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           });