import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:government_complaints_system/screens/auth_screens/login_screen.dart';
import 'package:government_complaints_system/screens/home/home_screen.dart';
import 'package:government_complaints_system/shared/components/components.dart';
import 'package:government_complaints_system/utils/constants.dart';
import 'package:government_complaints_system/utils/secure_storage.dart';

import 'data/api/user_api.dart';
import 'data/repo/user_repo.dart';
import 'layout/layout.dart';
import 'logic/auth_cubit/user_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(
            userRepo: UserRepo(UserApi()),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    return MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'), // عربي
        Locale('en'), // إنكليزي (اختياري)
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home:Layout(),
      // FutureBuilder<Widget>(
      //   future: _getStartScreen(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return  Scaffold(
      //         body: Center(child: CircularProgressIndicator(color: defaultColor,)),
      //       );
      //     }
      //     return snapshot.data!;
      //   },
      // ),
    );
  }
}

