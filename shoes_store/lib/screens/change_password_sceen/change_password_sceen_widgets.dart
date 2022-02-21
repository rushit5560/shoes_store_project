import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/change_password_sceen_controller/change_password_sceen_controller.dart';

class OldPasswordTextFieldModule extends StatelessWidget {
  OldPasswordTextFieldModule({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
          ]),
      child: TextFormField(
        controller: changePasswordScreenController.oldPassFieldController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'Old Password', radius: 30),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class NewPasswordTextFieldModule extends StatelessWidget {
  NewPasswordTextFieldModule({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
          ]),
      child: TextFormField(
        controller: changePasswordScreenController.newPassFieldController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'New Password', radius: 30),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class CNewPasswordTextFieldModule extends StatelessWidget {
  CNewPasswordTextFieldModule({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
          ]),
      child: TextFormField(
        controller: changePasswordScreenController.cNewPassFieldController,
        keyboardType: TextInputType.text,
        decoration: formInputDecoration(hintText: 'Confirm New Password', radius: 30),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (changePasswordScreenController.formKey.currentState!.validate()) {
          changePasswordScreenController.getForgotPasswordData(
            "${changePasswordScreenController.oldPassFieldController.text.trim()}",
            "${changePasswordScreenController.newPassFieldController.text.trim()}",
            "${changePasswordScreenController.cNewPassFieldController.text.trim()}",
          );
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}