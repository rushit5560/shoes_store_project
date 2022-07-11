import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/contants/user_details.dart';


class CommonFunctions {

  // This Function Use For Hide Keyboard
  hideKeyBoard() {
    FocusManager.instance.primaryFocus!.unfocus();
  }

  // This Function Use For Set UserId & Toke in sharedPreference
  Future<void> setUserDetailsInPrefs(id, token, userName, userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove('id');
    prefs.remove('token');
    prefs.remove('userName');
    prefs.remove('userEmail');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', true);
    prefs.setInt('id', id);
    prefs.setString('token', token);
    prefs.setString('userName', userName);
    prefs.setString('userEmail', userEmail);

    UserDetails.isUserLoggedIn = prefs.getBool('userLoggedInStatus') ?? false;
    UserDetails.userId = prefs.getInt('id') ?? 0;
    UserDetails.token = prefs.getString('token') ?? "";
    UserDetails.userName = prefs.getString('userName') ?? "";
    UserDetails.userEmail = prefs.getString('userEmail') ?? "";

  }

  Future<void> clearUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('token');
    prefs.remove('userName');
    prefs.remove('userEmail');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', false);
    prefs.setInt('id', 0);
    prefs.setString('token', "");
    prefs.setString('userName', "");
    prefs.setString('userEmail', "");

    UserDetails.isUserLoggedIn = false;
    UserDetails.userId = 0;
    UserDetails.token = "";
    UserDetails.userName = "";
    UserDetails.userEmail = "";

  }
}