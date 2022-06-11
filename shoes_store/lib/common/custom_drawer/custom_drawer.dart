import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/address_manager_screen/address_manager_screen.dart';
import 'package:shoes_store/screens/category_screen/category_screen.dart';
import 'package:shoes_store/screens/collection_screen/collection_screen.dart';
import 'package:shoes_store/screens/contact_us_screen/contact_us_screen.dart';
import 'package:shoes_store/screens/notification_screen/notification_screen.dart';
import 'package:shoes_store/screens/settings_screen/settings_screen.dart';
import 'package:shoes_store/screens/sign_in_screen/sign_in_screen.dart';

import '../../controllers/custom_drawer_controller/custom_drawer_controller.dart';
import '../../screens/blog_screen/blog_screen.dart';
import '../common_functions.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final customDrawerController = Get.put(CustomDrawerController());
  CommonFunctions commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        ()=> customDrawerController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
        : Stack(
            alignment: Alignment.topRight,
            children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    //margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        profilePicAndName(),
                        SizedBox(height: 20),
                        drawerList(),
                      ],
                    ),
                  ),
                ),
                customDrawerController.isLoggedIn.value
                    ? logout()
                : login(),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
                height: 25,
                width: 25,
                margin: EdgeInsets.only(top: 65, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Colors.black),
                child: Icon(Icons.close, color: Colors.white,)),
          ),
        ]),
      ),
    );
  }

  profilePicAndName() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade500, blurRadius: 12)
                ]),
            child: Center(
              child: Image.asset(Images.ic_logo, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              child: Text(
            "John Doe",
            textScaleFactor: 1.5,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Text(
            "john@demo.com",
            textScaleFactor: 1.3,
            style: TextStyle(color: Colors.black),
          ))
        ],
      ),
    );
  }

  drawerList() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Column(
        children: [
          // homeButton(),
          newCollection(),
          categories(),
          notification(),
          // setting(),
          contactUs(),
          addressManager(),
          blogs(),
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Image.asset(
        Images.ic_home,
        color: Colors.black,
          scale: 0.75,
      ),
      title: Text(
        'Home',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget newCollection() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CollectionScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'New Collection',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget categories() {
    return ListTile(
      onTap: () {
        Get.back();
         Get.to(() => CategoryScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Categories',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget notification() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => NotificationScreen());
      },
      leading: Image.asset(Images.ic_notification, color: Colors.black, scale: 0.75),
      title: Text(
        'Notification',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget setting() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SettingsScreen());
      },
      leading: Image.asset(Images.ic_setting, color: Colors.black, scale: 0.75),
      title: Text(
        'Settings',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget contactUs() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ContactUsScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Contact Us',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget addressManager() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AddressManagerScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Addresses',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget blogs() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => BlogScreen());
      },
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Blogs',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logout() {
    return ListTile(
      onTap: () async {
        Get.back();
        await commonFunctions.clearUserDetailsFromPrefs();
        Get.offAll(() => SignInScreen());
      },
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: Icon(Icons.logout, color: Colors.black),
      title: Text(
        'Logout',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget login() {
    return ListTile(
      onTap: () async {
        // Get.back();
        // await commonFunctions.clearUserDetailsFromPrefs();
        Get.to(() => SignInScreen());
      },
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: Icon(Icons.logout, color: Colors.black),
      title: Text(
        'LogIn',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

}
