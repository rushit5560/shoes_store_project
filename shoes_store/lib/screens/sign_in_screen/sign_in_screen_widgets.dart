import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:shoes_store/screens/signup_screen/signup_screen.dart';

class EmailIdTextField extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
          ]),
      child: TextFormField(
        controller: signInScreenController.emailIdFieldController,
        keyboardType: TextInputType.emailAddress,
        decoration: formInputDecoration(hintText: 'Email Id', radius: 30),
        validator: (value) => FieldValidator().validateEmail(value!),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
        ],
      ),
      child: TextFormField(
        controller: signInScreenController.passwordFieldController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: formInputDecoration(hintText: 'Password', radius: 30),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (signInScreenController.formKey.currentState!.validate()) {
          signInScreenController.getSignInData(
            "${signInScreenController.emailIdFieldController.text.trim().toLowerCase()}",
            "${signInScreenController.passwordFieldController.text.trim()}",
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
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
      ),
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  const SignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Don't have an Account?",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.off(() => SignUpScreen());
            },
            child: Container(
              child: Text(
                "Sign Up",
                style: TextStyle(color: AppColors.colorDarkPink, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
