import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/api/user_api.dart';
import '../../../data/repo/user_repo.dart';
import '../../../logic/auth_cubit/user_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../utils/constants.dart';
import 'forgotten_password_screen.dart';
import 'login_screen.dart';

class VerificationScreen extends StatelessWidget {
  final String? registerEmail;
  final String? requestCodeEmail;
  final bool isLengthCode;

  const VerificationScreen({
    super.key,
    required this.isLengthCode,
    this.registerEmail,
    this.requestCodeEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        surfaceTintColor: Theme.of(context).appBarTheme.surfaceTintColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: DefaultText(
                text: 'ادخل الكود',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: DefaultText(
                text: "تم ارسال الكود الى البريد الالكتروني",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 35),
            BlocProvider(
              create: (context) => UserCubit(userRepo: UserRepo(UserApi())),
              child: BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state.status == UserStatus.error) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state.status == UserStatus.loaded) {
                    if (isLengthCode) {
                      navigateAndFinish(context, LoginScreen());
                    } else {}
                  }
                },
                builder: (context, state) {
                  return PinCodeTextField(
                    appContext: context,
                    length: isLengthCode ? 6 : 4,
                    onCompleted: (value) {
                      if (isLengthCode) {
                        context.read<UserCubit>().userVerify(
                          verificationCode: value,
                        );
                      } else {
                        navigateTo(
                          context,
                          ForgottenPasswordScreen(
                            email: requestCodeEmail!,
                            code: value,
                          ),
                        );
                      }
                      print(value);
                    },
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    cursorColor: defaultColor,
                    pinTheme: PinTheme(
                      inactiveColor: defaultColor,
                      selectedColor: defaultColor,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: defaultColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            BlocProvider(
              create: (context) => UserCubit(userRepo: UserRepo(UserApi())),
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<UserCubit>().resendUserVerify();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: 'اعادة ارسال الكود',
                          style: TextStyle(color: defaultColor, fontSize: 16),
                        ),
                        Icon(
                          Icons.refresh_outlined,
                          color: defaultColor,
                          size: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
