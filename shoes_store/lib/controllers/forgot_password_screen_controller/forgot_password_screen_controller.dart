import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:http/http.dart' as http;

import '../../models/forgot_password_screen_model/forgot_password_screen_model.dart';

class ForgotPasswordScreenController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  TextEditingController emailIdFieldController = TextEditingController();

  forgotPasswordFunction()async{
    isLoading(true);
    String url = ApiUrl.ForgotPasswordApi;
    print('Url : $url');

    try{
      Map data = {
        "email": emailIdFieldController.text.trim(),
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(json.decode(response.body));
      isStatus = forgotPasswordModel.success.obs;

      if(isStatus.value){
       Fluttertoast.showToast(msg: forgotPasswordModel.message);
      } else {
        print('Forgot Password False');
      }

    } catch(e) {
      print('Forgot Password Error : $e');
    } finally {
      isLoading(false);
    }
  }
}