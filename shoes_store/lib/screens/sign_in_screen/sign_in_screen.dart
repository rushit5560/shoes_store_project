import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'sign_in_screen_widgets.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.colorLightGrey,
        elevation: 0,
        title: Text("Login"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Obx(
        () => signInScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Form(
                        key: signInScreenController.formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            EmailIdTextField(),
                            const SizedBox(height: 20),
                            PasswordTextField(),
                            const SizedBox(height: 25),
                            LoginButton(),
                            const SizedBox(height: 25),
                            OrTextModule(),
                            const SizedBox(height: 25),
                            LoginWithFacebookModule(),
                            const SizedBox(height: 10),
                            LoginWithGoogleModule(),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SignUpTextModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
