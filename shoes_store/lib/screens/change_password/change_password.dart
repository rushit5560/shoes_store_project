import 'package:flutter/material.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Change Password"),

      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      currentPasswordTextField(),
                      SizedBox(height: 20,),
                      newPasswordTextField(),
                      SizedBox(height: 20,),
                      confirmPasswordTextField(),
                      SizedBox(height: 50,),
                      changeButton()
                    ],
                  ),
                )
              ),
            ),
          ),
          Container()
        ],
      ),
    );
  }

  currentPasswordTextField(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20.0
            )
          ]
      ),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          //controller: signInPasswordFieldController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Current Password",
            //prefixIcon: Icon(icon, color: Colors.black),
            //isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            // border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
          )

        //validator: (value) => FieldValidator().validatePassword(value!),

      ),
    );
  }

  newPasswordTextField(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20.0
            )
          ]
      ),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          //controller: signInPasswordFieldController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "New Password",
            //prefixIcon: Icon(icon, color: Colors.black),
            //isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            // border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
          )

        //validator: (value) => FieldValidator().validatePassword(value!),

      ),
    );
  }

  confirmPasswordTextField(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20.0
            )
          ]
      ),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          //controller: signInPasswordFieldController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            //prefixIcon: Icon(icon, color: Colors.black),
            //isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            // border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)
            ),
          )

        //validator: (value) => FieldValidator().validatePassword(value!),

      ),
    );
  }

  changeButton(){
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.colorDarkPink
      ),
      child: Center(
        child: Text("Change",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
