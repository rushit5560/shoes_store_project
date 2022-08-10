import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/common_functions.dart';
import 'package:shoes_store/models/signin_screen_model/signin_model.dart';
import 'package:shoes_store/screens/index_screen/index_screen.dart';

class SignInScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getSignInData(String email, String password) async {
    isLoading(true);
    String url = ApiUrl.LoginApi;
    print("Url : $url");

    try {
      Map data = {"email": "$email", "password": "$password"};
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      if (response.body.contains('"success": false')) {
      } else {}

      // When User SignIn Failed
      if (response.body.contains('Email don')) {
        print('Email Don\'t Match');
        Get.snackbar(
          'Login Failed !',
          'Email Don\'t Match',
          colorText: Colors.white,
        );
      }
      if (response.body.contains('password don')) {
        print('Password Don\'t Match');
        Get.snackbar(
          'Login Failed !',
          'Password Don\'t Match',
          colorText: Colors.white,
        );
      } //

      SignInData signInData = signInDataFromJson(response.body);
      isStatus = signInData.success.obs;

      if (isStatus.value) {
        var id = signInData.data.id;
        var token = signInData.data.rememberToken;
        var userName = signInData.data.name;
        var userEmail = signInData.data.email;

        print('id : $id \nToken : $token');
        CommonFunctions().setUserDetailsInPrefs(id, token, userName, userEmail);
        Get.offAll(() => IndexScreen());
        Get.snackbar(
          'User Login Successfully.',
          '',
          colorText: Colors.white,
        );
      } else {
        print('SignIn False');
      }
    } catch (e) {
      print('Sign In Error : $e');
    } finally {
      isLoading(false);
    }
  }
}
