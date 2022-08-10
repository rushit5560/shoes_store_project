import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:shoes_store/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:shoes_store/screens/signup_screen/signup_screen.dart';

class EmailIdTextField extends StatelessWidget {
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 25.0,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 0),
            )
          ]),
      child: TextFormField(
        controller: signInScreenController.emailIdFieldController,
        keyboardType: TextInputType.emailAddress,
        decoration: formInputDecoration(hintText: 'Email Id', radius: 30),
        validator: (value) => FieldValidator().validateEmail(value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final signInScreenController = Get.find<SignInScreenController>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25.0,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: TextFormField(
        controller: signInScreenController.passwordFieldController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isVisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        decoration: formInputDecoration(
          hintText: 'Password',
          radius: 30,
          sufficIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(
              isVisible
                  ? Icons.remove_red_eye_rounded
                  : Icons.remove_red_eye_outlined,
              color: Colors.grey,
            ),
          ),
        ),
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

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        GestureDetector(
          onTap: () {
            Get.to(() => ForgotPasswordScreen());
          },
          child: Text(
            "FORGOT PASSWORD?",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ],
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
