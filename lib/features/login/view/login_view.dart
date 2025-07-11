import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/resources/colors/colors.dart';
import 'package:my_store/core/resources/styles/app_sized_box.dart';
import 'package:my_store/core/resources/styles/app_text_style.dart';
import 'package:my_store/features/login/controller/login_controller.dart';
import 'package:my_store/features/login/view/widgets/default_button.dart';
import 'package:my_store/features/login/view/widgets/default_form_field.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizedBox.sizedH100,
                AppSizedBox.sizedH100,
                const Text(
                  "Login to our app",
                  style: AppTextStyle.textStyleBoldBlack20,
                ),
                AppSizedBox.sizedH15,
                const Text(
                  "welcome back to our app",
                  style: AppTextStyle.textStyleMediumGray15,
                ),
                AppSizedBox.sizedH30,
                DefaultFormField(
                  controller: _email,
                  type: TextInputType.emailAddress,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!GetUtils.isEmail(value)) return 'Invalid email';
                    return null;
                  },
                  label: 'Email',
                  hint: 'Enter your email',
                  maxlines: 1,
                ),
                const SizedBox(height: 20),
                passwordFormField(
                  controller: _password,
                  type: TextInputType.visiblePassword,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) return 'Min 6 characters';
                    return null;
                  },
                  isPassword: true,
                  label: 'Password',
                  hint: 'Enter your password',
                  prefix: Icons.lock,
                  suffix: Icons.visibility_off,
                  suffixPressed: () {},
                ),
                AppSizedBox.sizedH20,
                const Text(
                  "forgot password ?",
                  style: AppTextStyle.textStyleblue16,
                ),
                const SizedBox(height: 30),
                DefaultButton(
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      controller.login(
                        email: _email.text.trim(),
                        password: _password.text,
                      );
                    }
                  },
                  text: "login",
                  textColor: AppColors.white,
                  bottonColor: AppColors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
