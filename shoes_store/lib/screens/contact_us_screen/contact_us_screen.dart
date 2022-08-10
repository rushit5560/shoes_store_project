import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/contact_us_screen_controller/contact_us_screen_controller.dart';
import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  final contactUsScreenController = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: commonAppBarModule(image: "Contact Us"),

      body: Obx(
        () => contactUsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : ContactUsForm(),
      ),

      // body: Container(
      //   child: Stack(
      //     children: [
      //       // GoogleMapModule(),
      //       Column(
      //         children: [
      //           ContactUsAppBarModule(),
      //           SizedBox(height: Get.height / 6),
      //           Expanded(
      //             child: Obx(() => contactUsScreenController.isLoading.value
      //                 ? CustomCircularProgressIndicator()
      //                 : ContactUsForm()),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  // contactForm() {
  //  return ;
  // }
  //
  // userNameTextField(){
  //   return Container(
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey.shade200),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.shade400,
  //               blurRadius: 10.0
  //           )
  //         ]
  //     ),
  //     child: TextFormField(
  //         keyboardType: TextInputType.emailAddress,
  //         //controller: signInPasswordFieldController,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: "Username",
  //           //prefixIcon: Icon(icon, color: Colors.black),
  //           //isDense: true,
  //           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           // border: InputBorder.none,
  //           filled: true,
  //           fillColor: Colors.white,
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           errorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedErrorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //         )
  //
  //       //validator: (value) => FieldValidator().validatePassword(value!),
  //
  //     ),
  //   );
  // }
  //
  // emailTextField(){
  //   return Container(
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey.shade200),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.shade400,
  //               blurRadius: 10.0
  //           )
  //         ]
  //     ),
  //     child: TextFormField(
  //         keyboardType: TextInputType.emailAddress,
  //         //controller: signInPasswordFieldController,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: "Email Id",
  //           //prefixIcon: Icon(icon, color: Colors.black),
  //           //isDense: true,
  //           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           // border: InputBorder.none,
  //           filled: true,
  //           fillColor: Colors.white,
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           errorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedErrorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //         )
  //
  //       //validator: (value) => FieldValidator().validatePassword(value!),
  //
  //     ),
  //   );
  // }
  //
  // subjectTextField(){
  //   return Container(
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey.shade200),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.shade400,
  //               blurRadius: 10.0
  //           )
  //         ]
  //     ),
  //     child: TextFormField(
  //         keyboardType: TextInputType.emailAddress,
  //         //controller: signInPasswordFieldController,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: "Subject",
  //           //prefixIcon: Icon(icon, color: Colors.black),
  //           //isDense: true,
  //           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           // border: InputBorder.none,
  //           filled: true,
  //           fillColor: Colors.white,
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           errorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedErrorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //         )
  //
  //       //validator: (value) => FieldValidator().validatePassword(value!),
  //
  //     ),
  //   );
  // }
  //
  // commentTextField(){
  //   return Container(
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey.shade200),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.shade400,
  //               blurRadius: 10.0
  //           )
  //         ]
  //     ),
  //     child: TextFormField(
  //         keyboardType: TextInputType.emailAddress,
  //         //controller: signInPasswordFieldController,
  //         obscureText: true,
  //         //maxLines: 5,
  //         decoration: InputDecoration(
  //           hintText: "Comment",
  //           //prefixIcon: Icon(icon, color: Colors.black),
  //           //isDense: true,
  //           contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           // border: InputBorder.none,
  //           filled: true,
  //           fillColor: Colors.white,
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           errorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //           focusedErrorBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               borderSide: BorderSide(color: Colors.white)
  //           ),
  //         )
  //
  //       //validator: (value) => FieldValidator().validatePassword(value!),
  //
  //     ),
  //   );
  // }
  //
  // changeButton(){
  //   return Container(
  //     height: 45,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(30),
  //       color: AppColors.colorDarkPink
  //     ),
  //     child: Center(
  //       child: Text("Change", style: TextStyle(
  //         fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold
  //       ),),
  //     ),
  //   );
  // }
}
