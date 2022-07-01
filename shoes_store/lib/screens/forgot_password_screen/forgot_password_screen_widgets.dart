import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';

class EmailIdTextField extends StatelessWidget {
  EmailIdTextField({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0)
          ]),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: forgotPasswordScreenController.emailIdFieldController,
        decoration: formInputDecoration(hintText: 'Email Id'),
        validator: (value) => FieldValidator().validateEmail(value!),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);

  final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(forgotPasswordScreenController.formKey.currentState!.validate()){
          forgotPasswordScreenController.forgotPasswordFunction();
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
