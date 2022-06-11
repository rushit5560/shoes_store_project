import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/api_url.dart';
import '../../common/images.dart';
import '../../models/checkout_screen_model/order_add_model.dart';
import '../../models/profile_screen_model/country_model.dart';
import '../../screens/confirm_screen/confirm_screen.dart';
import '../../screens/index_screen/index_screen.dart';



class CheckOutScreenController extends GetxController {
  int userCartId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isSelectedIndex = 0.obs;
  RxInt userId = 0.obs;

  GlobalKey<FormState> checkoutFormKey = GlobalKey();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController companyNameFieldController = TextEditingController();
  TextEditingController streetAddressFieldController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();
  TextEditingController stateFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController orderNoteFieldController = TextEditingController();
  RxList<Datum> countryLists = [Datum(id: 0, name: 'Select Country', sortname: '')].obs;
  Datum? countryDropDownValue;



  Future<void> addOrderFunction() async {
    isLoading(true);
    String url = ApiUrl.AddOrderApi;
    print('Url : $url');

    String orderType = selectPaymentMethod(isSelectedIndex.value);

    try{
      Map data = {
        "user_id": "$userId",
        "cartID": "$userCartId",
        "userFname": "${firstNameFieldController.text}",
        "userLname": "${lastNameFieldController.text}",
        "userStreet_address": "${streetAddressFieldController.text}",
        "userCity": "${cityFieldController.text}",
        "usersState": "${stateFieldController.text}",
        "userPhone": "${phoneNoFieldController.text}",
        "userEmail": "${emailIdFieldController.text}",
        "userOrderNote": "${orderNoteFieldController.text}",
        "order_type": "$orderType"
      };
      print('asasasasasssas data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Cart Response1 : ${response.statusCode}');
      print('Cart Response2 : ${response.body}');

      OrderAddData orderAddData = OrderAddData.fromJson(json.decode(response.body));
      isSuccessStatus = orderAddData.success.obs;
      print('Response Bool : ${orderAddData.success}');
      print('isStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        Get.offAll(()=> ConfirmScreen());

        Get.snackbar('Order Placed Successfully.', 'Check You Email');
      }
      else {
        print('OrderAddData False False');
      }

    } catch(e){
      print('Add Order Error : $e');
    }
    isLoading(false);
  }



  /// Get All Country List
  Future<void> getAllCountryData() async {
    isLoading(true);
    String url = ApiUrl.CountryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      AllCountryData countryList = AllCountryData.fromJson(json.decode(response.body));
      isSuccessStatus = countryList.success.obs;

      if(isSuccessStatus.value){
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

  List<CheckOutPaymentModel> paymentMethodList = [
    CheckOutPaymentModel(
        img: Images.mastercard,
        name: 'Master Card'
    ),
    CheckOutPaymentModel(
        img: Images.paypal,
        name: 'Paypal'
    ),
    CheckOutPaymentModel(
        img: Images.visa,
        name: 'Visa Card'
    ),
    CheckOutPaymentModel(
        img: Images.cod,
        name: 'Cash On Delivery'
    ),
  ];

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    getAllCountryData();
    super.onInit();
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getInt('id') ?? 0;
    print('UserId Add to Cart : $userId');
  }

  String selectPaymentMethod(int i) {
    if(i == 0) {
      return "Master Card";
    } else if(i == 1) {
      return "Paypal";
    } else if(i == 2) {
      return "Visa Card";
    } else if(i == 3) {
      return "Cash On Delivery";
    } else {
      return "";
    }
  }

}


class CheckOutPaymentModel{
  String img;
  String name;
  CheckOutPaymentModel({required this.img, required this.name});
}