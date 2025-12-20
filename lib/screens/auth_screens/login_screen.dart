import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/data/api/user_api.dart';
import 'package:government_complaints_system/data/repo/user_repo.dart';
import 'package:government_complaints_system/screens/auth_screens/register_screen.dart';
import 'package:government_complaints_system/screens/auth_screens/request_code_screen.dart';

import '../../../layout/layout.dart';
import '../../../logic/auth_cubit/user_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../utils/constants.dart';

var formKey = GlobalKey<FormState>();
var loginEmailController = TextEditingController();
var loginPasswordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 15, left: 15, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: DefaultText(
                        text: 'تسجيل دخول'.toUpperCase(),
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight
                            .bold)
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                      text: 'البريد الالكتروني / رقم الهاتف',
                      style: TextStyle()
                  ),
                ),
                CustomTextFormFiled(
                  controller: loginEmailController,
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: loginPasswordController,
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
                Align(
                  alignment: Alignment.topRight,
                  child: DefaultTextButton(
                    text: 'هل نسيت كلمة المرور ؟',
                    color: defaultColor,
                    size: 15,
                    onPressed: () {
                      navigateTo(context, RequestCodeScreen());
                    },
                  ),
                ),
                SizedBox(height: 10),
                 BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state.status == UserStatus.error) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      } else if (state.status == UserStatus.loaded) {
                        navigateAndFinish(context, Layout());
                      }
                    },
                    builder: (context, state) {
                      if (state.status == UserStatus.loading) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: defaultColor),
                          ],
                        );
                      }
                      return DefaultButton(
                        text: 'تسجل الدخول'.toUpperCase(),
                        onPress: () {
                          context.read<UserCubit>().userLogin(
                            email: loginEmailController.text,
                            password: loginPasswordController.text,
                          );
                        },
                        width: double.infinity,
                        background: defaultColor,
                      );
                    },
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
                  child: DefaultTextButton(
                    text: 'انشاء حساب',
                    color: secondaryColor,
                    size: 16,
                    onPressed: () {
                      navigateAndFinish(context, RegisterScreen());
                    },
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
