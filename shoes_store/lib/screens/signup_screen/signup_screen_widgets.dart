import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:shoes_store/screens/sign_in_screen/sign_in_screen.dart';

class NameTextField extends StatelessWidget {
  NameTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

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
        controller: signUpScreenController.userNameFieldController,
        decoration: formInputDecoration(hintText: 'Name'),
        validator: (value) => FieldValidator().validateFullName(value!),
      ),
    );
  }
}

class EmailIdTextField extends StatelessWidget {
  EmailIdTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

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
        controller: signUpScreenController.emailIdFieldController,
        decoration: formInputDecoration(hintText: 'Email Id'),
        validator: (value) => FieldValidator().validateEmail(value!),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  PasswordTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: signUpScreenController.passwordFieldController,
        obscureText: true,
        decoration: formInputDecoration(hintText: 'Password'),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(signUpScreenController.formKey.currentState!.validate()){
          signUpScreenController.getRegisterData(
            "${signUpScreenController.userNameFieldController.text.trim()}",
            "${signUpScreenController.emailIdFieldController.text.trim().toLowerCase()}",
            "${signUpScreenController.passwordFieldController.text.trim()}",
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
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Already have an Account?",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.off(() => SignInScreen());
            },
            child: Container(
              child: Text(
                "Login",
                style: TextStyle(color: AppColors.colorDarkPink, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
