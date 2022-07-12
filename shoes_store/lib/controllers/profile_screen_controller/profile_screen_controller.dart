import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  String userAddressMobileNo = "1234567890";
  int countryId = 0;
  int stateId = 0;
  int cityId = 0;

  File ? file;
  String ? userProfile;

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

        for(int i = 0; i < countryLists.length; i++) {
          if(countryId == countryLists[i].id) {
            countryDropDownValue = countryLists[i];
            await getStateData(countryDropDownValue!.id);
          }
        }
        if(countryId == 1001) {
          countryDropDownValue = countryLists[0];
        }
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

        for(int i = 0; i < stateLists.length; i++) {
          if(stateId == stateLists[i].id) {
            stateDropDownValue = stateLists[i];
            await getCityData(stateDropDownValue!.id);
          }
        }
        if(stateId == 1001) {
          stateDropDownValue = stateLists[0];
        }
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

        for(int i = 0; i < cityLists.length; i++) {
          if(cityId == cityLists[i].id) {
            cityDropDownValue = cityLists[i];
          }
        }

        if(cityId == 1001) {
          cityDropDownValue = cityLists[0];
        }

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
      if(file != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(file!.openRead());

        stream.cast();

        var length = await file!.length();

        request.files.add(await http.MultipartFile.fromPath("Image", file!.path));

       // request.headers.addAll(apiHeader.headers);

        request.fields['userid'] = "$userId";
        request.fields['name'] = "$userName";
        request.fields['country'] = "${countryDropDownValue!.id}";
        request.fields['state'] = "${stateDropDownValue!.id}";
        request.fields['city'] = "${cityDropDownValue!.id}";


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var multiPart = http.MultipartFile(
          'Image',
          stream,
          length,
        );

        request.files.add(multiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateProfileData response1 = UpdateProfileData.fromJson(json.decode(value));
          log('response1 ::::::${response1.message}');
          isStatus = response1.success.obs;
          log('status : $isStatus');

          if(isStatus.value){
            Fluttertoast.showToast(msg: response1.message);
            Get.back();
            getUserProfileFunction(userId: "$userId");
          } else {
            log('status code false: ${response1.success}');
            log('response1.errorMessage: ${response1.message}');
            //if(response1.errorMessage.contains("Token don't match")){
            //Fluttertoast.showToast(msg: response1.errorMessage);
            Fluttertoast.showToast(msg: response1.message);
            // }

            log('False False');
          }
        });
      }
      else {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //request.headers.addAll(apiHeader.headers);

        request.fields['userid'] = "$userId";
        request.fields['name'] = "$userName";
        request.fields['country'] = "${countryDropDownValue!.id}";
        request.fields['state'] = "${stateDropDownValue!.id}";
        request.fields['city'] = "${cityDropDownValue!.id}";


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateProfileData response1 = UpdateProfileData.fromJson(json.decode(value));
          log('response1 ::::::${response1.message}');
          isStatus = response1.success.obs;
          log('status : $isStatus');

          if(isStatus.value){
            Fluttertoast.showToast(msg: response1.message);
            Get.back();
            getUserProfileFunction(userId: "$userId");
          } else {
            log('status code false: ${response1.success}');
            log('response1.errorMessage: ${response1.message}');
            //if(response1.errorMessage.contains("Token don't match")){
            //Fluttertoast.showToast(msg: response1.errorMessage);
            Fluttertoast.showToast(msg: response1.message);
            // }

            log('False False');
          }
        });
      }




    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
      //addStarPointAPI();
    }
  }

  /// Get User Profile
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
        userProfile = userData.image!;
        fullNameController.text = userProfileModel.data.name!;
        countryId = userProfileModel.data.country ?? 1001;
        stateId = userProfileModel.data.state ?? 1001;
        cityId = userProfileModel.data.city ?? 1001;

        log("countryId : $countryId");
        log("stateId : $stateId");
        log("cityId : $cityId");

        log('userProfile: $userProfile');
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

  /// Get User All Address
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
        userAddressMobileNo = userAllAddressData.data.shippinginfo.mobile;
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