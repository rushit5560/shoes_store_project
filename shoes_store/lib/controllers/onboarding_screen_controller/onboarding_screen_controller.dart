import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/index_screen/index_screen.dart';
import 'package:shoes_store/screens/login_screen/login_screen.dart';
import 'package:shoes_store/models/onboarding_screen_model/onboarding_model.dart';

class OnBoardingScreenController extends GetxController{
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    //forwardAction();
    super.onInit();
  }

  goToLoginScreen() => Get.offAll(()=> LoginScreen());

  setOnBoardingValue()async{
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    prefs.getBool("onboarding");
    print('Set Value : ${prefs.getBool("onboarding")}');
  }

  /*forwardAction() {
    print("value==$isLastPage");
    if(isLastPage){

      //setOnBoardingValue();
      Timer(Duration(seconds: 1), () => IndexScreen());
      //Get.off(() => IndexScreen());
    } else {
      // pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }*/

  List<OnBoardingInfo> onBoardingPages= [
    OnBoardingInfo(
      imageAsset: Images.ic_service1,
      title: '30 Days Money Back Guarantee',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: Images.ic_service2,
      title: 'Free Delivery',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: Images.ic_service3,
      title: 'Secure Payment',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
  ];
}