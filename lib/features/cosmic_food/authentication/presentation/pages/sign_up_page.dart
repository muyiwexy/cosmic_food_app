import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/widgets/custom_button.dart';
import '../../../common/presentation/widgets/custom_input_text_field.dart';
import '../../../common/presentation/widgets/text_types.dart';
import '../provider/user_registration_provider.dart';

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
                fontsize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            CustomInputField(
              pSizedBoxHeight: 50,
              size: size,
              fSContainerBorderColor: AppColors.secondary01,
              fSContainerColor: AppColors.secondary01,
              fSSizedBoxHeight: 55,
              controller: nameController,
              hintText: "Enter Name",
              isFilled: true,
              fontSize: 20,
              fillColor: AppColors.primary02,
              textFieldBorderColors: AppColors.secondary01,
              textColors: AppColors.secondary01,
            ),
            const SizedBox(height: 20),
            CustomInputField(
              pSizedBoxHeight: 50,
              size: size,
              fSContainerBorderColor: AppColors.secondary01,
              fSContainerColor: AppColors.secondary01,
              fSSizedBoxHeight: 55,
              controller: emailController,
              hintText: "Enter E-mail",
              isFilled: true,
              fontSize: 20,
              fillColor: AppColors.primary02,
              textFieldBorderColors: AppColors.secondary01,
              textColors: AppColors.secondary01,
            ),
            const SizedBox(height: 20),
            CustomInputField(
              pSizedBoxHeight: 50,
              size: size,
              fSContainerBorderColor: AppColors.secondary01,
              fSContainerColor: AppColors.secondary01,
              fSSizedBoxHeight: 55,
              controller: passwordController,
              hintText: "Enter Password",
              isFilled: true,
              fontSize: 20,
              fillColor: AppColors.primary02,
              textFieldBorderColors: AppColors.secondary01,
              textColors: AppColors.secondary01,
            ),
            const SizedBox(height: 30),
            CustomButton(
              pSizedBoxHeight: 70,
              pSizedBoxWidth: size.width / 4,
              fSContainerBorderColor: AppColors.secondary01,
              fSContainerColor: AppColors.secondary01,
              fSradius: 20,
              textColor: AppColors.secondary01,
              fSSizedBoxHeight: 55,
              fSSizedBoxWidth: size.width,
              buttonRadius: 20,
              fontWeight: FontWeight.w900,
              buttonTextFontSize: 30,
              buttonText: "Submit",
              callbackFunction: () async {
                // this call initiates user sign up from the repository through the ChangeNotifier class
                await userRegProvider.signUpUser(emailController.text,
                    passwordController.text, nameController.text, context);

                // clear text controllers
                nameController.clear();
                emailController.clear();
                passwordController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
