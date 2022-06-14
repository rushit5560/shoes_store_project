import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/api_url.dart';
import '../../models/address_manager_screen_model/user_billing_address.dart';
import '../../models/address_manager_screen_model/user_shipping_address.dart';
import '../../models/profile_screen_model/user_all_address.dart';

class AddressManagerScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  var userId;

  GlobalKey<FormState> shippingKey = GlobalKey();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController shippingMobileController = TextEditingController();
  TextEditingController shippingEmailController = TextEditingController();


  GlobalKey<FormState> billingKey = GlobalKey();
  TextEditingController billingAddressController = TextEditingController();
  TextEditingController billingMobileController = TextEditingController();
  TextEditingController billingEmailController = TextEditingController();


  /// Save Billing Address
  getUserBillingAddress() async {
    isLoading(true);
    String url = ApiUrl.AddUserBillingAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId",
        "address": "${billingAddressController.text.trim()}",
        "mobile": "${billingMobileController.text.trim()}",
        "email": "${billingEmailController.text.toLowerCase().trim()}"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      BillingAddressData billingAddressData = BillingAddressData.fromJson(json.decode(response.body));
      isStatus = billingAddressData.success.obs;
      print('Response Bool : ${billingAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('User Billing Address True True');
        // Get.back();
        Get.snackbar(billingAddressData.message, '');

      } else {
        print('User Billing Address False False');
      }

    } catch(e) {
      print('User Billing Address Error : $e');
    }
    // isLoading(false);
    await getUserDetailsFromPrefs();
  }

  /// Save Shipping Address
  getUserShippingAddress() async {
    isLoading(true);
    String url = ApiUrl.AddUserShippingAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId",
        "address": "${shippingAddressController.text.trim()}",
        "mobile": "${shippingMobileController.text.trim()}",
        "email": "${shippingEmailController.text.toLowerCase().trim()}"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      ShippingAddressData shippingAddressData = ShippingAddressData.fromJson(json.decode(response.body));
      isStatus = shippingAddressData.success.obs;
      print('Response Bool : ${shippingAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        print('User Shipping Address True True');
        // Get.back();
        Get.snackbar(shippingAddressData.message, '');

      } else {
        print('User Shipping Address False False');
      }

    } catch(e) {
      print('User Shipping Address Error : $e');
    }
    // isLoading(false);
    await getUserDetailsFromPrefs();
  }

  /// GetAll Addresses
  getUserAllAddress(userId) async {
    isLoading(true);
    String url = ApiUrl.UserAllAddressApi;
    print('User Address Url : $url');

    try{
      Map data = {
        "user_id": "$userId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      UserAllAddressData userAllAddressData = UserAllAddressData.fromJson(json.decode(response.body));
      isStatus = userAllAddressData.success.obs;
      print('Response Bool : ${userAllAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        billingAddressController.text = userAllAddressData.data.billinginfo.address;
        billingMobileController.text = userAllAddressData.data.billinginfo.mobile;
        billingEmailController.text = userAllAddressData.data.billinginfo.email;

        shippingAddressController.text = userAllAddressData.data.shippinginfo.address;
        shippingMobileController.text = userAllAddressData.data.shippinginfo.mobile;
        shippingEmailController.text = userAllAddressData.data.shippinginfo.email;
        print('User All Address True True');
      } else {
        print('User All Address False False');
      }
    } catch(e) {
      print('User All Address Error : $e');
    }
    isLoading(false);
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId : $userId');
    await getUserAllAddress(userId);
  }



  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

  void clearAllFields() {
    shippingAddressController.clear();
    shippingMobileController.clear();
    shippingEmailController.clear();

    billingAddressController.clear();
    billingMobileController.clear();
    billingEmailController.clear();
  }
}