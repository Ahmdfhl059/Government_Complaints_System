import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:government_complaints_system/screens/auth_screens/verification.dart';
import 'package:government_complaints_system/shared/localization/app_localization.dart';

import '../../../data/api/user_api.dart';
import '../../../data/repo/user_repo.dart';
import '../../../logic/auth_cubit/user_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../utils/constants.dart';

var formKey = GlobalKey<FormState>();
var radiokey = GlobalKey<FlutterRadioGroupState>();
var firstNameStudentController = TextEditingController();
var lastNameStudentController = TextEditingController();
var phoneNumberStudentController = TextEditingController();

class FillStudentDataScreen extends StatelessWidget {
  final String email;
  final String password;
  final String confirmPassword;

  const FillStudentDataScreen({
    super.key,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: DefaultText(
                    text: 'user_information'.tr(context),
                    style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'first_name'.tr(context),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: firstNameStudentController,
                  type: TextInputType.name,
                  prefix: Icons.person_2_outlined,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_first_name".tr(context);
                    } else {}
                  },
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'last_name'.tr(context),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: lastNameStudentController,
                  type: TextInputType.name,
                  prefix: Icons.person_2_outlined,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_last_name".tr(context);
                    } else {}
                  },
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultText(
                    text: 'phone'.tr(context),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                CustomTextFormFiled(
                  controller: phoneNumberStudentController,
                  type: TextInputType.number,
                  prefix: Icons.phone_outlined,
                  borderColor: defaultColor,
                  iconColor: secondaryColor,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "error_phone".tr(context);
                    } else {}
                  },
                ),
                SizedBox(height: 40),
                BlocProvider(
                  create: (context) =>
                      UserCubit(userRepo: UserRepo(UserApi())),
                  child: BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state.status == UserStatus.error) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      } else if (state.status == UserStatus.loaded) {
                        navigateAndFinish(context, VerificationScreen(isLengthCode: true,registerEmail: email,requestCodeEmail: '',));
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
                        text: 'done'.tr(context).toUpperCase(),
                        onPress: () {
                          context.read<UserCubit>().userRegister(
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                            firstName: firstNameStudentController.text,
                            lastName: lastNameStudentController.text,
                            phoneNumber: phoneNumberStudentController.text,
                          );
                        },
                        width: double.infinity,
                        background: defaultColor,
                      );
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
