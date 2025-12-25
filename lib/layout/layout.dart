import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:government_complaints_system/screens/complaint_log/complaint_log_screen.dart';
import 'package:government_complaints_system/screens/profile/profile_screen.dart';
import 'package:government_complaints_system/shared/components/components.dart';
import 'package:government_complaints_system/shared/localization/app_localization.dart';
import '../data/repo/fcm_token_repo.dart';
import '../screens/home/home_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../utils/constants.dart';


class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {


  //
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((v) async {
  //     FCMTokenRepo fcmTokenRepo = FCMTokenRepo();
  //     final String fcmToken = await getToken();
  //     if (fcmToken.isNotEmpty) {
  //       await fcmTokenRepo.postFCMToken(fcmToken);
  //     }
  //   });
  //
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [HomeScreen(), ComplaintLogScreen(), ProfileScreen()];
    List<String> titles = ['Home'.tr(context), 'complaint_log'.tr(context), 'Profile'.tr(context)];
    int currentIndex = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defaultColor,
        title: Text(
          titles[currentIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          DefaultIconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined, color: Colors.white),
          ),
          DefaultIconButton(
            onPressed: () {
              navigateTo(context, SettingsScreen());
            },
            icon: Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: GNav(
        tabs: [
          GButton(icon: Icons.home_outlined, text: 'Home'.tr(context)),
          GButton(icon: Icons.apps_outlined, text: 'complaint_log'.tr(context)),
          GButton(icon: Icons.person_outline, text: 'Profile'.tr(context)),
        ],
        selectedIndex: currentIndex,
        onTabChange: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        activeColor: defaultColor,
        textSize: 20,
        textStyle: TextStyle(color: secondaryColor),
        backgroundColor: Colors.white,
        iconSize: 30,
        padding: EdgeInsetsGeometry.all(20),
      ),
    );
  }
}
