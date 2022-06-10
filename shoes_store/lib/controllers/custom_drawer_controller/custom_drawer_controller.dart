import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawerController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isLoggedIn = false.obs;


  getUserLoggedDetails() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('userLoggedInStatus') ?? false;
    isLoading(false);
  }

  @override
  void onInit() {
    getUserLoggedDetails();
    super.onInit();
  }

}