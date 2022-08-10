import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/controllers/settings_screen_controller/setting_screen_controller.dart';
import 'package:shoes_store/screens/change_password_sceen/change_password_sceen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  SettingScreenController settingScreenController =
      Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Settings"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    emailNotification(),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 5),
                    smsNotification(),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 5),
                    profileAvailability(),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 5),
                    sentRequest(),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 5),
                    changePassword(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  emailNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Notification",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Default notification will be sent",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            )
          ],
        ),
        Obx(
          () => Switch(
            value: settingScreenController.isEmail.value,
            onChanged: (value) {
              // setState(() {
              settingScreenController.isEmail.value = value;
              print(settingScreenController.isEmail.value);
              //      });
            },
            activeTrackColor: AppColors.colorDarkPink,
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }

  smsNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SMS Notification",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Receive SMS notification",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            )
          ],
        ),
        Obx(
          () => Switch(
            value: settingScreenController.isSms.value,
            onChanged: (value) {
              // setState(() {
              settingScreenController.isSms.value = value;
              print(settingScreenController.isSms.value);
              //      });
            },
            activeTrackColor: AppColors.colorDarkPink,
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }

  profileAvailability() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile Availability",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Everyone can sent me a request",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )
          ],
        ),
        Obx(
          () => Switch(
            value: settingScreenController.isProfile.value,
            onChanged: (value) {
              // setState(() {
              settingScreenController.isProfile.value = value;
              print(settingScreenController.isProfile.value);
              //      });
            },
            activeTrackColor: AppColors.colorDarkPink,
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }

  sentRequest() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sent Request",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Default notification will be sent",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )
          ],
        ),
        Obx(
          () => Switch(
            value: settingScreenController.isRequest.value,
            onChanged: (value) {
              // setState(() {
              settingScreenController.isRequest.value = value;
              print(settingScreenController.isRequest.value);
              //      });
            },
            activeTrackColor: AppColors.colorDarkPink,
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }

  changePassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => ChangePasswordScreen());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "you must need your registered email",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        Container(),
        /*Obx(()=>
            Switch(
              value: settingScreenController.isPassword.value,
              onChanged: (value) {
                // setState(() {
                settingScreenController.isPassword.value = value;
                print(settingScreenController.isPassword.value);
                //      });
              },
              activeTrackColor: AppColors.colorDarkPink,
              activeColor: Colors.white,
            ),
        ),*/
      ],
    );
  }
}
