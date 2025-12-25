import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/screens/auth_screens/register_screen.dart';
import 'package:government_complaints_system/screens/auth_screens/request_code_screen.dart';
import 'package:government_complaints_system/shared/localization/app_localization.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 15, left: 15, top: 25, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Local(),
              SizedBox(height: 100),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: DefaultText(
                      text: 'sign in'.tr(context).toUpperCase(),
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight
                          .bold)
                  ),
                ),
              ),
              SizedBox(height: 25),
              DefaultText(
                  text: 'email/phone'.tr(context),
                  style: TextStyle()
              ),
              CustomTextFormFiled(
                controller: loginEmailController,
                type: TextInputType.emailAddress,
                prefix: Icons.email_outlined,
                borderColor: defaultColor,
                iconColor: secondaryColor,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "error_email/phone".tr(context);
                  } else {}
                },
              ),
              SizedBox(height: 15),
              DefaultText(
                text: 'password'.tr(context),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
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
                    return "error_password".tr(context);
                  } else {}
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: DefaultTextButton(
                  text: 'forgot_password'.tr(context),
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
                      text: 'login'.tr(context).toUpperCase(),
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
                  text: 'sign up'.tr(context),
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
    );
  }
}
