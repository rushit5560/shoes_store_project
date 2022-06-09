import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/screens/home_screen/home_screen.dart';
import 'package:shoes_store/controllers/index_screen_controller/index_screen_controller.dart';
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
     ProfileScreen(),
   ];
  int currentPage = 2;
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
      bottomNavigationBar: Obx(() => naviBar(context, changeIndex)),

      body: _pageOptions[currentPage],


    );
  }

   Widget naviBar(BuildContext context, changeIndex) {
     return Container(
       height: Get.height * 0.07,
       alignment: Alignment.center,
       decoration: BoxDecoration(
         borderRadius: const BorderRadius.only(
           topLeft: Radius.circular(25),
           topRight: Radius.circular(25),
         ),
         // color: AppColors.colorLightGrey,
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[

           InkWell(
             onTap: () {
               changeIndex.call(0);
               log("${indexScreenController.menuIndex.value}");

               indexScreenController.menuIndex.value = 0;
             },
             child: SizedBox(
               height: 30,
               width: 30,
              child: Icon(Icons.notification_important),
             ),
           ),

           InkWell(
             onTap: () {
               changeIndex.call(1);
               log("${indexScreenController.menuIndex.value}");

               indexScreenController.menuIndex.value = 1;
             },
             child: SizedBox(
               height: 30,
               width: 30,
               child: Icon(Icons.settings),
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
               child: Icon(Icons.favorite),
             ),
           ),

           InkWell(
             onTap: () {
               changeIndex.call(3);
               log("${indexScreenController.menuIndex.value}");

               indexScreenController.menuIndex.value = 3;
             },
             child: SizedBox(
               height: 30,
               width: 30,
               child: Icon(Icons.home),
             ),
           ),

           InkWell(
             onTap: () {
               changeIndex.call(4);
               log("${indexScreenController.menuIndex.value}");

               indexScreenController.menuIndex.value = 4;
             },
             child: SizedBox(
               height: 30,
               width: 30,
               child: Icon(Icons.person),
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
     } else if(indexScreenController.menuIndex.value == 3) {
       return OrderScreen();
     } else {
       return ProfileScreen();
     }
   }

}
