import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/home_screen/home_screen.dart';
import 'package:shoes_store/screens/index_screen/index_screen_controller.dart';
import 'package:shoes_store/screens/notification_screen/notification_screen.dart';
import 'package:shoes_store/screens/order_screen/order_screen.dart';
import 'package:shoes_store/screens/profile_screen/profile_screen.dart';
import 'package:shoes_store/screens/settings_screen/settings_screen.dart';

class IndexScreen extends StatefulWidget {
   IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
   IndexScreenController indexScreenController = Get.put(IndexScreenController());

   final _pageOptions = [
     NotificationScreen(),
     SettingsScreen(),
     HomeScreen(),
     OrderScreen(),
     ProfileScreen()
   ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
          circleColor: AppColors.colorDarkPink,
          inactiveIconColor: Colors.black,
          tabs: [
            TabData(iconData: Icons.notification_important, title: ""),
            TabData(iconData: Icons.settings, title: ""),
            TabData(iconData: Icons.home, title: ""),
            TabData(iconData: Icons.home, title: ""),
            TabData(iconData: Icons.person, title: "")
          ],
          onTabChangedListener: (int position) {
            setState(() {
                currentPage = position;
            });
          },
      ),
      body: _pageOptions[currentPage],
    );
  }
}
