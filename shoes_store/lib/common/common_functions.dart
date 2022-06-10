import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/contants/user_details.dart';


class CommonFunctions {

  // This Function Use For Hide Keyboard
  hideKeyBoard() {
    FocusManager.instance.primaryFocus!.unfocus();
  }

  // This Function Use For Set UserId & Toke in sharedPreference
  Future<void> setUserDetailsInPrefs(id, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove('id');
    prefs.remove('token');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', true);
    prefs.setInt('id', id);
    prefs.setString('token', token);

    UserDetails.isUserLoggedIn = prefs.getBool('userLoggedInStatus') ?? false;
    UserDetails.userId = prefs.getInt('id') ?? 0;
    UserDetails.token = prefs.getString('token') ?? "";

  }

  Future<void> clearUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('token');

    // Add New Id & Token
    prefs.setBool('userLoggedInStatus', false);
    prefs.setInt('id', 0);
    prefs.setString('token', "");

    UserDetails.isUserLoggedIn = false;
    UserDetails.userId = 0;
    UserDetails.token = "";

  }
}