import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:government_complaints_system/logic/local_cubit/local_state.dart';
import 'package:government_complaints_system/screens/auth_screens/login_screen.dart';
import 'package:government_complaints_system/shared/localization/app_localization.dart';
import 'package:government_complaints_system/utils/constants.dart';
import 'package:government_complaints_system/utils/secure_storage.dart';

import 'data/api/user_api.dart';
import 'data/repo/user_repo.dart';
import 'layout/layout.dart';
import 'logic/auth_cubit/user_cubit.dart';
import 'logic/local_cubit/local_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        LocaleCubit()
          ..getSavedLanguage()),
        BlocProvider(create: (_) => UserCubit(userRepo: UserRepo(UserApi()))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getStartScreen() async {
    final token = await SecureStorage.getToken();
    if (token.isNotEmpty) {
      return const Layout();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState >(
      builder: (context, state) {
        if (state is ChangeLocaleState) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            home:
            FutureBuilder<Widget>(
              future: _getStartScreen(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(color: defaultColor,)),
                  );
                }
                return snapshot.data!;
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
