import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/login_screen/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.colorLightgrey,
        elevation: 0,
        title: Text("SignUp"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  nameTextField(),
                  SizedBox(height: 20,),
                  emailTextField(),
                  SizedBox(height: 20,),
                  passwordTextField(),
                  SizedBox(height: 25,),
                  signUpButton(),
                  SizedBox(height: 25,),
                  orText(),
                  SizedBox(height: 25,),
                  loginWithFacebookButton(),
                  SizedBox(height: 10,),
                  loginWithGoogleButton(),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            alreadyHaveAccount()
          ],
        ),
      ),
    );
  }

  nameTextField(){
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
            hintText: "Name",
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

  emailTextField(){
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
            hintText: "Email Id",
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

  passwordTextField(){
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
            hintText: "Password",
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

  signUpButton(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkPink
      ),
      child: Center(
        child: Text("Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),),
      ),
    );
  }

  orText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Container(color: Colors.grey.shade300, height: 2)),
        SizedBox(width: 5,),
        Text("OR", style: TextStyle(
            color: Colors.black, fontSize: 17
        ),),
        SizedBox(width: 5,),
        Expanded(
            flex: 1,
            child: Container(color: Colors.grey.shade300, height: 2)),
      ],
    );
  }

  loginWithFacebookButton(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkBlue
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.ic_facebook),
            SizedBox(width: 10,),
            Text("Login WIth Facebook",
              style: TextStyle(color: Colors.white, fontSize: 18),)
          ],
        ),
      ),
    );
  }

  loginWithGoogleButton(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkRed
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.ic_google),
            SizedBox(width: 10,),
            Text("Login WIth Google",
                style: TextStyle(color: Colors.white, fontSize: 18))
          ],
        ),
      ),
    );
  }

  alreadyHaveAccount(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Already have an Account?",
              style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
          SizedBox(width: 5,),
          GestureDetector(
            onTap: (){
              Get.to(() => LoginScreen());
            },
            child: Container(
              child: Text("Login",
                style: TextStyle(color: AppColors.colorDarkPink, fontSize: 18),),
            ),
          )
        ],
      ),
    );
  }
}
