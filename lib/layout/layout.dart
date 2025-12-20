import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:government_complaints_system/screens/complaint_log/complaint_log_screen.dart';
import 'package:government_complaints_system/screens/profile/profile_screen.dart';
import 'package:government_complaints_system/shared/components/components.dart';
import '../data/repo/fcm_token_repo.dart';
import '../screens/home/home_screen.dart';
import '../utils/constants.dart';

List<Widget> _screens = [HomeScreen(), ComplaintLogScreen(), ProfileScreen()];
List<String> _titles = ['الرئيسية', 'السجل', 'الملف الشخصي'];
int currentIndex = 0;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defaultColor,
        title: Text(
          _titles[currentIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          DefaultIconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined, color: Colors.white),
          ),
          DefaultIconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      extendBody: true,
      body: _screens[currentIndex],
      bottomNavigationBar: GNav(
        tabs: [
          GButton(icon: Icons.home_outlined, text: 'الرئيسية'),
          GButton(icon: Icons.apps_outlined, text: 'سجل الشكاوي'),
          GButton(icon: Icons.person_outline, text: 'الملف الشخصي'),
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
