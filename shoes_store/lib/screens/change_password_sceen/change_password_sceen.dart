import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/change_password_sceen_controller/change_password_sceen_controller.dart';

import 'change_password_sceen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController =
      Get.put(ChangePasswordScreenController());
  final size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      resizeToAvoidBottomInset: true,
      appBar: commonAppBarModule(image: "Change Password"),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white),
        child: Obx(
          () => changePasswordScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : SingleChildScrollView(
                  child: Container(
                    height: size.height * 0.9,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Form(
                      key: changePasswordScreenController.formKey,
                      child: Column(
                        children: [
                          Spacer(),
                          OldPasswordTextFieldModule(),
                          const SizedBox(height: 20),
                          NewPasswordTextFieldModule(),
                          const SizedBox(height: 20),
                          CNewPasswordTextFieldModule(),
                          const SizedBox(height: 30),
                          SubmitButtonModule(),
                          const SizedBox(height: 20),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
