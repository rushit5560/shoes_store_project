import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'signup_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.colorLightGrey,
        elevation: 0,
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Form(
                  key: signUpScreenController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: 30),
                            NameTextField(),
                            SizedBox(height: 20),
                            EmailIdTextField(),
                            SizedBox(height: 20),
                            PasswordTextField(),
                            SizedBox(height: 25),
                            SignUpButton(),
                            SizedBox(height: 25),
                            OrTextModule(),
                            SizedBox(height: 25),
                            // LoginWithFacebookModule(),
                            // SizedBox(height: 10),
                            LoginWithGoogleModule(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      LoginText()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
