import 'dart:async';

import 'package:get/get.dart';
import 'package:shoes_store/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreenViewController extends GetxController{
  getOnBoardingValue() {
    Get.off(()=> OnBoardingscreen());
  }

  @override
  void onInit() {
    print('-----------Controller Init Method Called.-----------');
    Timer(Duration(seconds: 7), () => getOnBoardingValue());
    super.onInit();
  }
}