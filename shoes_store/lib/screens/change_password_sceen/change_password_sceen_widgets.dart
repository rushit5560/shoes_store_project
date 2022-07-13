import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/field_validation.dart';
import 'package:shoes_store/common/input_field_decoration.dart';
import 'package:shoes_store/controllers/change_password_sceen_controller/change_password_sceen_controller.dart';

class OldPasswordTextFieldModule extends StatelessWidget {
  OldPasswordTextFieldModule({Key? key}) : super(key: key);
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 25.0,
              spreadRadius: 1,
            ),
          ]),
      child: TextFormField(
        controller: changePasswordScreenController.oldPassFieldController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: formInputDecoration(hintText: 'Old Password', radius: 30),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class NewPasswordTextFieldModule extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 25.0,
              spreadRadius: 1,
            ),
          ]),
      child: Obx(
        ()=> TextFormField(
          controller: changePasswordScreenController.newPassFieldController,
          keyboardType: TextInputType.text,
          obscureText: changePasswordScreenController.isNewVisible.value,
          decoration: formInputDecoration(
            hintText: 'New Password',
            radius: 30,
            sufficIcon: IconButton(
              onPressed: () {
                changePasswordScreenController.isLoading(true);
                changePasswordScreenController.isNewVisible.value =
                !changePasswordScreenController.isNewVisible.value;
                changePasswordScreenController.isLoading(false);
              },
              icon: Icon(
                changePasswordScreenController.isNewVisible.value
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          validator: (value) => FieldValidator().validatePassword(value!),
          /*decoration: InputDecoration(
            hintText: "New Password",
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              onPressed: () {
                changePasswordScreenController.isLoading(true);
                changePasswordScreenController.isNewVisible.value =
                !changePasswordScreenController.isNewVisible.value;
                changePasswordScreenController.isLoading(false);
              },
              icon: Icon(
                changePasswordScreenController.isNewVisible.value
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined,
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.grey)),
          ),*/
        ),
      ),
    );
  }
}

class CNewPasswordTextFieldModule extends StatelessWidget {
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 25.0,
              spreadRadius: 1,
            ),
          ]),
      child: Obx(
        ()=> TextFormField(
          controller: changePasswordScreenController.cNewPassFieldController,
          keyboardType: TextInputType.text,
          obscureText: changePasswordScreenController.isConfirmNewVisible.value,
          decoration: formInputDecoration(
              hintText: 'Confirm New Password',
              radius: 30,
              sufficIcon: IconButton(
                onPressed: () {
                  changePasswordScreenController.isLoading(true);
                  changePasswordScreenController.isConfirmNewVisible.value =
                  !changePasswordScreenController.isConfirmNewVisible.value;
                  changePasswordScreenController.isLoading(false);
                },
                icon: Icon(
                  changePasswordScreenController.isConfirmNewVisible.value
                      ? Icons.remove_red_eye_rounded
                      : Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                ),
              )),
          validator: (value) {
            if (value!.isEmpty) {
              return "password is required";
            } else if (value.length < 6) {
              return "Length should be 6 character";
            } else if (value.toString() !=
                changePasswordScreenController.newPassFieldController.text) {
              return "Password and confirm password should be same";
            }
            return null;
          },
        ),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final changePasswordScreenController =
      Get.find<ChangePasswordScreenController>();

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
