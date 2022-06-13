import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/models/profile_screen_model/city_model.dart';
import 'package:shoes_store/models/profile_screen_model/country_model.dart';
import 'package:shoes_store/models/profile_screen_model/state_model.dart';
import 'package:shoes_store/models/profile_screen_model/update_profile_model.dart';

import '../../models/profile_screen_model/user_all_address.dart';
import '../../models/profile_screen_model/user_profile_model.dart';


class ProfileScreenController extends GetxController {
  RxBool isPersonalInfoSelected = true.obs;
  RxBool isOrderSelected = false.obs;
  var userId;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  Datum? countryDropDownValue;
  DatumState? stateDropDownValue;
  DatumCity? cityDropDownValue;
  UserData userData = UserData();
  String userAddress = "";

  RxList<Datum> countryLists = [Datum(id: 0, name: 'Select Country', sortname: '')].obs;
  RxList<DatumState> stateLists = [DatumState(id: 0, name: 'Select State', countryId: 0)].obs;
  RxList<DatumCity> cityLists = [DatumCity(id: 0, name: 'Select City', stateId: 0)].obs;

  getAllCountryData() async {
    isLoading(true);
    String url = ApiUrl.CountryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      AllCountryData countryList = AllCountryData.fromJson(json.decode(response.body));
      isStatus = countryList.success.obs;

      if(isStatus.value){
        countryLists.clear();
        countryLists.add(Datum(id: 0, name: 'Select Country', sortname: ''));
        countryLists.addAll(countryList.data);
        countryDropDownValue = countryLists[0];
        print('countryLists : ${countryLists.length}');
      } else {
        print('Country False False');
      }
    } catch(e) {
      print('Country Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getStateData(int countryId) async {
    // isLoading(true);
    String url = ApiUrl.StateApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$countryId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      StateData stateData = StateData.fromJson(json.decode(response.body));
      isStatus = stateData.success.obs;
      if(isStatus.value){
        stateLists.clear();
        stateLists.add(DatumState(id: 0, name: 'Select State', countryId: 0));
        stateLists.addAll(stateData.data);
        stateDropDownValue = stateLists[0];
        print('stateLists : ${stateLists.length}');
      } else {
        print('State False False');
      }
    } catch(e) {
      print('State Error : $e');
    } finally {
      // isLoading(false);
      loading();
    }
  }

  getCityData(int stateId) async {
    isLoading(true);
    String url = ApiUrl.CityApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$stateId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      CityData cityData = CityData.fromJson(json.decode(response.body));
      isStatus = cityData.success.obs;

      if(isStatus.value){
        cityLists.clear();
        cityLists.add(DatumCity(id: 0, name: 'Select City', stateId: 0));
        cityLists.addAll(cityData.data);
        cityDropDownValue = cityLists[0];
        print('cityLists : ${cityLists.length}');
      } else {
        print('City False False');
      }
    } catch(e){
      print('City Error : $e');
    } finally {
      isLoading(false);
    }
  }

  updateProfileData(String userName) async {
    isLoading(true);
    String url = ApiUrl.UpdateUserProfileApi;
    print('Url : $url');

    try{
      Map data = {
        "userid": "$userId",
        "name": "$userName",
        "country": "${countryDropDownValue!.id}",
        "state": "${stateDropDownValue!.id}",
        "city": "${cityDropDownValue!.id}"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      UpdateProfileData updateProfileData = UpdateProfileData.fromJson(json.decode(response.body));
      isStatus = updateProfileData.success.obs;

      if(isStatus.value){
        countryDropDownValue = countryLists[0];
        stateDropDownValue = stateLists[0];
        cityDropDownValue = cityLists[0];
        Get.back();
        Get.snackbar('Success', '${updateProfileData.message}');
        fullNameController.clear();
        loading();
      } else {
        Get.snackbar('Failed', '${updateProfileData.message}');
      }
    } catch(e){
      print('Update Profile Error : $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getUserProfileFunction({required String userId}) async {
    isLoading(true);
    String url = ApiUrl.GetProfileApi + "$userId";
    log("getUserProfileFunction Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("User Profile Api Response : ${response.body}");

      UserProfileModel userProfileModel = UserProfileModel.fromJson(json.decode(response.body));
      isStatus = userProfileModel.success.obs;

      if(isStatus.value) {
        userData = userProfileModel.data;
        log("userData : ${userData.name}");
      } else {
        log("getUserProfileFunction Else Else");
      }

    } catch(e) {
      log("getUserProfileFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getUserAllAddress(userId.toString());
    }

  }

  Future<void> getUserAllAddress(String userId) async {
    // isLoading(true);
    String url = ApiUrl.UserAllAddressApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('Response1 : ${response.statusCode}');
      print('Response1 : ${response.body}');

      UserAllAddressData userAllAddressData = UserAllAddressData.fromJson(json.decode(response.body));
      isStatus = userAllAddressData.success.obs;
      print('Response Bool : ${userAllAddressData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        userAddress = userAllAddressData.data.shippinginfo.address;
      } else {
        print('User All Address False False');
      }
    } catch(e) {
      print('User All Address Error : $e');
    }
    // isLoading(false);
    await getAllCountryData();
  }

  @override
  void onInit() {
    // getAllCountryData();
    getUserDetailsFromPrefs();
    countryDropDownValue = countryLists[0];
    stateDropDownValue = stateLists[0];
    cityDropDownValue = cityLists[0];
    super.onInit();
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId : $userId');
    await getUserProfileFunction(userId: "$userId");
  }

  loading(){
    isLoading(true);
    isLoading(false);
  }

}