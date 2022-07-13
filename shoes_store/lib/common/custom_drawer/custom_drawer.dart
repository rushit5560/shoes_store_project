import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/contants/user_details.dart';
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
import '../../screens/order_screen/order_screen.dart';
import '../common_functions.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final customDrawerController = Get.put(CustomDrawerController());
  CommonFunctions commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Obx(
        () => customDrawerController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 85, left: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 5),
                                // UserDetails.isUserLoggedIn == true
                                //     ? profilePicAndName()
                                //     : Container(),
                                profilePicAndName(),
                                SizedBox(height: 20),
                                drawerList(),
                              ],
                            ),
                          ),
                        ),
                        UserDetails.isUserLoggedIn == true ? logout() : login(),
                      ],
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   child: Container(
                  //       height: 25,
                  //       width: 25,
                  //       margin: EdgeInsets.only(top: 75, right: 20),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           color: Colors.black),
                  //       child: Icon(
                  //         Icons.close,
                  //         color: Colors.white,
                  //       )),
                  // ),
                ],
              ),
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
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 20,
                  offset: Offset(0, 2),
                  spreadRadius: 5,
                )
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Images.ic_logo,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            child: UserDetails.isUserLoggedIn == true
                ? Text(
                    "${UserDetails.userName}",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                : Container(),
          ),
          SizedBox(height: 5),
          Container(
            child: UserDetails.isUserLoggedIn == true
                ? Text(
                    "${UserDetails.userEmail}",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.black),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  drawerList() {
    return Container(
      // margin: EdgeInsets.only(left: 5),
      child: Column(
        children: [
          // homeButton(),
          newCollection(),
          categories(),
          // notification(),
          // setting(),
          contactUs(),
          UserDetails.isUserLoggedIn == true ? addressManager() : Container(),
          UserDetails.isUserLoggedIn == true ? allOrders() : Container(),
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
      minLeadingWidth: 30,
      title: Text(
        'Home',
        textScaleFactor: 1.3,
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
      leading: Image.asset(
        Images.ic_home,
        color: Colors.black,
        scale: 0.75,
      ),
      minLeadingWidth: 30,
      title: Text(
        //'New Collection',
        'Product',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      title: Text(
        'Category',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      leading:
          Image.asset(Images.ic_notification, color: Colors.black, scale: 0.75),
      title: Text(
        'Notification',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      leading: Image.asset(Images.ic_setting, color: Colors.black, scale: 0.75),
      title: Text(
        'Settings',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Contact Us',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Address',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget allOrders() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => OrderScreen());
      },
      minLeadingWidth: 30,
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Orders',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      title: Text(
        'Blogs',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logout() {
    return ListTile(
      onTap: () async {
        customDrawerController.isLoading(true);

        await commonFunctions.clearUserDetailsFromPrefs();
        // customDrawerController.loadUI();
        customDrawerController.isLoading(false);
        Get.back();
        Get.snackbar("User logout successfully!", "");
      },
      minLeadingWidth: 30,
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: Icon(Icons.logout, color: Colors.black),
      title: Text(
        'Logout',
        textScaleFactor: 1.3,
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
      minLeadingWidth: 30,
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: Icon(Icons.login, color: Colors.black),
      title: Text(
        'Login',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
