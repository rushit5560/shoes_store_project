import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/settings_screen/setting_screen_controller.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);

   SettingScreenController settingScreenController = Get.put(SettingScreenController());

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
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  color: Colors.white
              ),
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    emailNotification(),
                    SizedBox(height: 5,),

                    Divider(color: Colors.grey.shade500,),
                    SizedBox(height: 5,),
                    smsNotification(),

                    SizedBox(height: 5,),
                    Divider(color: Colors.grey.shade500,),
                    SizedBox(height: 5,),

                    profileAvaiability(),

                    SizedBox(height: 5,),
                    Divider(color: Colors.grey.shade500,),
                    SizedBox(height: 5,),

                    sentRequest(),

                    SizedBox(height: 5,),
                    Divider(color: Colors.grey.shade500,),
                    SizedBox(height: 5,),

                    changePassword(),

                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),

          Container()
        ],
         
      ),
    );
  }

   emailNotification(){
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Email Notification",
               style: TextStyle(
                   color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500
               ),),
             SizedBox(height: 5,),
             Text("Default notification will be sent",
               style: TextStyle(fontSize: 18, color: Colors.black),)
           ],
         ),
         Obx(()=>
             Switch(
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

   smsNotification(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SMS Notification",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 5,),
            Text("Receive SMS notification",
              style: TextStyle(fontSize: 18, color: Colors.black),)
          ],
        ),
        Obx(()=>
            Switch(
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

   profileAvaiability(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Avaiability",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 5,),
            Text("Everyone can sent me a request",
              style: TextStyle(fontSize: 18, color: Colors.black),)
          ],
        ),
        Obx(()=>
            Switch(
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

   sentRequest(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sent Request",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 5,),
            Text("Default notification will be sent",
              style: TextStyle(fontSize: 18, color: Colors.black),)
          ],
        ),
        Obx(()=>
            Switch(
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

   changePassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Password",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 5,),
            Text("you must need youe verified email",
              style: TextStyle(fontSize: 18, color: Colors.black),)
          ],
        ),
        Obx(()=>
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
        ),

      ],
    );
   }
}
