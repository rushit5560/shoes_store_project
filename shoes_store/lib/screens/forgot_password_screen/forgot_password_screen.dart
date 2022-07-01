import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'package:shoes_store/screens/forgot_password_screen/forgot_password_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.colorLightGrey,
        elevation: 0,
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Obx(
            () => forgotPasswordScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
          child: Form(
            key: forgotPasswordScreenController.formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      EmailIdTextField(),
                      SizedBox(height: 25),
                      SubmitButton(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
