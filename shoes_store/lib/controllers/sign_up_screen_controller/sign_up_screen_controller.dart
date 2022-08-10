import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/common_functions.dart';
import 'package:shoes_store/models/signup_screen_model/signup_model.dart';
import 'package:shoes_store/screens/index_screen/index_screen.dart';

class SignUpScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  RxBool isPassVisible = true.obs;
  FacebookUserProfile? profile;
  final FacebookLogin plugin = FacebookLogin(debug: true);

  getRegisterData() async {
    isLoading(true);
    String url = ApiUrl.RegisterApi;
    print('Url : $url');

    try {
      Map data = {
        "name": userNameFieldController.text.trim(),
        "email": emailIdFieldController.text.trim().toLowerCase(),
        "password": passwordFieldController.text.trim(),
        "c_password": passwordFieldController.text.trim(),
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      // When User SignUp Failed
      if (response.body.contains('The email has already been taken')) {
        print('Email Already Registered');
        Get.snackbar('Error!', 'Email already registered');
      }

      SignUpData signUpData = SignUpData.fromJson(json.decode(response.body));
      isStatus = signUpData.success.obs;

      if (isStatus.value) {
        var id = signUpData.data[0].id;
        var token = signUpData.data[0].rememberToken;
        var userName = signUpData.data[0].name;
        var userEmail = signUpData.data[0].email;
        // Save id And token in SharedPreference
        CommonFunctions().setUserDetailsInPrefs(id, token, userName, userEmail);
        Get.offAll(() => IndexScreen());
        Get.snackbar('User registered successfully.', '');
      } else {
        print('Register False');
      }
    } catch (e) {
      print('Register Error : $e');
    } finally {
      isLoading(false);
    }
  }

  Future googleAuthentication(context) async {
    // try {
    //   googleSignInManager.signOut();
    //   final result = await googleSignInManager.signIn();
    //   if (result != null) {
    //     if (result.email != "") {
    //       Map params = {
    //         "userName": result.displayName ?? "",
    //         "emailId": result.email,
    //         "serviceName": 'GOOGLE',
    //         "uniqueId": "",
    //         "loginPassword": "",
    //       };
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => IndexScreen()),
    //       );
    //       // _socialLoginAPI(params, state.context);
    //       print("userName");
    //     } else {
    //       // commonMessageDialog(state.context,
    //       //     title: "Error",
    //       //     message:
    //       //     "Your Google account is not linked with email. Please signup and login with email and password.");
    //     }
    //   }
    // } catch (error) {
    //   print(error);
    // }
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print("Email: ${result.user!.email}");
      print("Username: ${result.user!.displayName}");
      print("User Id: ${result.user!.uid}");
      // todo - Set UserId

      //login = prefs.getString('userId');
      //print(login);
      if (result != null) {
        // prefs.setString('userId', result.user!.uid);
        // prefs.setString('userName', result.user!.displayName!);
        // prefs.setString('email', result.user!.email!);
        // prefs.setString('photo', result.user!.photoURL!);
        // prefs.setBool('isLoggedIn', false);

        //Get.off(() => IndexScreen());

        String userName = result.user!.displayName!;
        String email = result.user!.email!;
        userNameFieldController.text = userName;
        emailIdFieldController.text = email;
        passwordFieldController.text = "${userNameFieldController.text}@123";

        await getRegisterData();
      }
    }
    isLoading(false);
  }

  Future signInWithFacebookFunction() async {
    await plugin.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );

    await subPartOfFacebookLogin();
    await plugin.logOut();
  }

  subPartOfFacebookLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final plugin1 = plugin;
    final token = await plugin1.accessToken;

    String? email;
    String? imageUrl;

    if (token != null) {
      log("token===$token");
      profile = await plugin1.getUserProfile();
      log("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin1.getUserEmail();
        emailIdFieldController.text = email!;
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if (profile != null) {
        if (profile!.userId.isNotEmpty) {
          String userName = profile!.name!;
          userNameFieldController.text = userName;
          passwordFieldController.text = "${userNameFieldController.text}@123";

          await getRegisterData();

          // prefs.setString('userId', profile!.userId);
          // prefs.setString('userName', profile!.firstName!);
          // prefs.setString('email', email!);
          // prefs.setString('photo', imageUrl!.toString());

          // String ? userId = prefs.getString('userId');
          // String ? uName = prefs.getString('userName');
          // String ? uEmail = prefs.getString('email');
          // String ? uPhotoUrl = prefs.getString('photo');
          // log('id: $userId, username : $uName, email : $uEmail, photo : $uPhotoUrl');
        }
      }
    }
  }
}
