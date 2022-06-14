import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/api_url.dart';
import '../../models/order_screen_model/user_total_order_model.dart';

class OrderScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<OrderData> totalOrdersLists = [];


  getUserTotalOrders(userId) async {
    print('userId : $userId');
    isLoading(true);
    String url = ApiUrl.UserTotalOrderApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id": "$userId"
      };
      print('data : $data');
      http.Response response = await http.post(Uri.parse(url),body: data);

      TotalOrdersModel totalOrdersModel = TotalOrdersModel.fromJson(json.decode(response.body));
      isStatus = totalOrdersModel.success.obs;
      print('Response Bool : ${totalOrdersModel.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        totalOrdersLists.clear();
        totalOrdersLists = totalOrdersModel.data;
      } else {
        print('Total Orders False False');
      }
    } catch(e){
      print('User Total Orders Error :$e');
    } finally {
      isLoading(false);
    }
  }

  getUserDetailsFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    await getUserTotalOrders(userId1);
  }


  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}