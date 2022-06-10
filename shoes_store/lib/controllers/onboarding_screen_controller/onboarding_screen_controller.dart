import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/models/onboarding_screen_model/onboarding_model.dart';
import 'package:shoes_store/screens/sign_in_screen/sign_in_screen.dart';

class OnBoardingScreenController extends GetxController{
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  @override
  void onInit() {
    //forwardAction();
    super.onInit();
  }

  goToLoginScreen() => Get.offAll(()=> SignInScreen());

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