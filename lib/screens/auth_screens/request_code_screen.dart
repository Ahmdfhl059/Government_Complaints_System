import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/screens/auth_screens/verification.dart';

import '../../../data/api/user_api.dart';
import '../../../data/repo/user_repo.dart';
import '../../../logic/auth_cubit/user_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../utils/constants.dart';

var formKey = GlobalKey<FormState>();
var requestCodeEmailController = TextEditingController();

class RequestCodeScreen extends StatelessWidget {
  const RequestCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        surfaceTintColor: Theme.of(context).appBarTheme.surfaceTintColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: DefaultText(
                  text: 'forgot_password',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultText(
                  text: 'email',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              CustomTextFormFiled(
                controller: requestCodeEmailController,
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
                      var email = requestCodeEmailController;
                      navigateTo(
                        context,
                        VerificationScreen(requestCodeEmail:email.text,isLengthCode: false, registerEmail: '',),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.status == UserStatus.loading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator(color:defaultColor,)],
                      );
                    }
                    return DefaultButton(
                      text: 'next'.toUpperCase(),
                      onPress: () {
                        context
                            .read<UserCubit>()
                            .userResendVerificationCode(
                              email: requestCodeEmailController.text,
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
    );
  }
}
