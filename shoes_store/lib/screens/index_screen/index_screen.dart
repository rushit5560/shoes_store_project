import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/contants/user_details.dart';
import 'package:shoes_store/screens/home_screen/home_screen.dart';
import 'package:shoes_store/controllers/index_screen_controller/index_screen_controller.dart';
import 'package:shoes_store/screens/notification_screen/notification_screen.dart';
import 'package:shoes_store/screens/profile_screen/profile_screen.dart';
import 'package:shoes_store/screens/settings_screen/settings_screen.dart';
import 'package:shoes_store/screens/sign_in_screen/sign_in_screen.dart';
import '../../common/app_colors.dart';
import '../wishlist_screen/wishlist_screen.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  IndexScreenController indexScreenController =
      Get.put(IndexScreenController());

  // final _pageOptions = [
  //   NotificationScreen(),
  //   SettingsScreen(),
  //   HomeScreen(),
  //   OrderScreen(),
  //   ProfileScreen(),
  // ];
  // int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: FancyBottomNavigation(
      //     circleColor: AppColors.colorDarkPink,
      //     inactiveIconColor: Colors.black,
      //     tabs: [
      //       TabData(iconData: Icons.notification_important, title: ""),
      //       TabData(iconData: Icons.settings, title: ""),
      //       TabData(iconData: Icons.home, title: ""),
      //       TabData(iconData: Icons.favorite, title: ""),
      //       TabData(iconData: Icons.person, title: "")
      //     ],
      //     onTabChangedListener: (int position) {
      //       setState(() {
      //           currentPage = position;
      //       });
      //     },
      // ),

      // body: _pageOptions[currentPage],

      body: Obx(
        () => Container(
          child: getMenuByIndex,
        ),
      ),

      bottomNavigationBar: Obx(() => naviBar(context, changeIndex)),
    );
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: Get.height * 0.07,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(0);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 0;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.notification_important,
                color: indexScreenController.menuIndex.value == 0
                    ? AppColors.colorDarkPink
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(1);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 1;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.settings,
                color: indexScreenController.menuIndex.value == 1
                    ? AppColors.colorDarkPink
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 2;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.home,
                color: indexScreenController.menuIndex.value == 2
                    ? AppColors.colorDarkPink
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(3);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 3;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.favorite,
                color: indexScreenController.menuIndex.value == 3
                    ? AppColors.colorDarkPink
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(4);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 4;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.person,
                color: indexScreenController.menuIndex.value == 4
                    ? AppColors.colorDarkPink
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeIndex(int index) {
    indexScreenController.menuIndex.value = index;
  }

  Widget get getMenuByIndex {
    log("menuIndex -> " + indexScreenController.menuIndex.toString());

    if (indexScreenController.menuIndex.value == 0) {
      return NotificationScreen();
    } else if (indexScreenController.menuIndex.value == 1) {
      return SettingsScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return HomeScreen();
    } else if (indexScreenController.menuIndex.value == 3) {
      return WishlistScreen();
    } else {
      return ProfileScreen();
    }
  }
}
