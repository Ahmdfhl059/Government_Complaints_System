import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_complaints_system/shared/localization/app_localization.dart';

import '../../shared/components/components.dart';
import '../../utils/constants.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: defaultColor,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: DefaultText(
          text: 'settings'.tr(context),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DefaultListTile(
              textTitle: 'Language'.tr(context),
              leading: Icon(Icons.language_outlined),
              trailing: Local(),
              isSubTitle: false,

            ),
            SizedBox(height: 10),
            // DefaultListTile(
            //   textTitle: 'Theme',
            //   textSubTitle: isTheme ? 'Dark' : 'Light',
            //   leading: isTheme
            //       ? Icon(Icons.mode_night_outlined)
            //       : Icon(Icons.light_mode_outlined),
            //   trailing: BlocBuilder<ThemeCubit, ThemeState>(
            //     builder: (context, state) {
            //       if (state is LoadedThemeState) {
            //         return Switch(
            //           activeTrackColor: Colors.grey.shade400,
            //           activeColor: secondaryColor,
            //           value: state.isOn,
            //           onChanged: (newValue) {
            //             context.read<ThemeCubit>().toggleSwitch(newValue);
            //             setState(() {
            //               isTheme = newValue;
            //             });
            //           },
            //         );
            //       }
            //       return SizedBox();
            //     },
            //   ),
            // ),
            SizedBox(height: 10),
            //
            // BlocListener<StudentCubit, StudentState>(
            //   listener: (context, state) {
            //     navigateAndFinish(context, LoginScreen());
            //   },
            //   child: DefaultListTile(
            //     onTap: () {
            //       context.read<StudentCubit>().studentLogout();
            //     },
            //     textTitle: 'Logout',
            //     leading: Icon(Icons.logout),
            //     isSubTitle: false,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
