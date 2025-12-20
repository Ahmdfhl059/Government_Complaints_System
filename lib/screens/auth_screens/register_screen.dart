import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../utils/constants.dart';
import 'fill_student_data_screen.dart';
import 'login_screen.dart';

var formKey = GlobalKey<FormState>();
var registerEmailController = TextEditingController();
var registerPasswordController = TextEditingController();
var registerConfirmPasswordController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: DefaultText(
                      text: 'انشاء حساب'.toUpperCase(),
                      style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'البريد الالكتروني',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: registerEmailController,
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_email";
                    } else {}
                  },
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'كلمة السر',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: registerPasswordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock_outlined,
                  isPassword: true,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_password";
                    } else {}
                  },
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'تأكيد كلمة السر',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: registerConfirmPasswordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock_outlined,
                  isPassword: true,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_password";
                    } else {}
                  },
                ),
                SizedBox(height: 30),
                DefaultButton(
                  text: 'التالي'.toUpperCase(),
                  onPress: () {
                    var email = registerEmailController;
                    var password = registerPasswordController;
                    var confirmPassword = registerConfirmPasswordController;
                    navigateTo(
                      context,
                      FillStudentDataScreen(
                        email: email.text,
                        password: password.text,
                        confirmPassword: confirmPassword.text,
                      ),
                    );
                  },
                  width: double.infinity,
                  background: defaultColor,
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.fromBorderSide(
                      BorderSide(color: defaultColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: "هل لديك حساب ؟ ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DefaultTextButton(
                        text: 'تسجيل دخول'.toUpperCase(),
                        color: defaultColor,
                        size: 16,
                        onPressed: () {
                          navigateAndFinish(context, LoginScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
