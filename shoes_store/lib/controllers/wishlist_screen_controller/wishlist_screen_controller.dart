import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/api_url.dart';
import '../../models/product_detail_screen_model/addtocart_model.dart';
import '../../models/wishlist_screen_model/delete_wishlist_model.dart';
import '../../models/wishlist_screen_model/wishlist_model.dart';
import '../../screens/cart_screen/cart_screen.dart';

class WishlistScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<Datum> userWishLists = RxList();
  RxString? deleteMsg;

  var userId;

  getUserWishlistFunction(userId) async {
    isLoading(true);
    String url = ApiUrl.UserWishListApi;
    print('Url : $url');

    try{
      Map data = {
        "id" : "$userId"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('User Wishlist Response1 : ${response.statusCode}');
      print('User Wishlist Response2 : ${response.body}');

      UserWishlistData userWishlistData = UserWishlistData.fromJson(json.decode(response.body));
      isSuccessStatus = userWishlistData.success.obs;
      print('Response Bool : ${userWishlistData.success}');
      print('isStatus : $isSuccessStatus}');

      if(isSuccessStatus.value){
        print('User Wishlist True');
        userWishLists = userWishlistData.data.obs;
        print('User Wish list New Length: ${userWishLists.length}');
      } else {
        print('User WishList False');
      }

    } catch(e){
      print('User Wishlist Error : $e');
    }
    isLoading(false);
  }

  getDeleteWishlistFunction(wishListId) async{
    isLoading(true);
    String url = ApiUrl.DeleteWishListApi;
    print('Url : $url');

    try{
      Map data = {
        "delId" : "$wishListId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('Delete Wishlist Response1 : ${response.statusCode}');
      print('Delete Wishlist Response2 " ${response.body}');

      DeleteWishlistData deleteWishlistData = DeleteWishlistData.fromJson(json.decode(response.body));
      isSuccessStatus = deleteWishlistData.success.obs;
      print('Response Bool : ${deleteWishlistData.success}');
      print('isStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        print('Delete Wishlist True');
        deleteMsg = deleteWishlistData.message.obs;
        Get.snackbar("Item is deleted from wishlist", "");

        userWishLists.clear();
        print('User Wish list Delete Length: ${userWishLists.length}');

        await getUserDetails();
      } else {
        print('Delete Wishlist False');
      }

    } catch(e){
      print('Delete Wishlist Error : $e');
    }
    isLoading(false);
  }


  getDeleteWishlistFunctionNew(wishListId) async{
    isLoading(true);
    String url = ApiUrl.DeleteWishListApi;
    print('Url : $url');

    try{
      Map data = {
        "delId" : "$wishListId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      print('Delete Wishlist Response1 : ${response.statusCode}');
      print('Delete Wishlist Response2 " ${response.body}');

      DeleteWishlistData deleteWishlistData = DeleteWishlistData.fromJson(json.decode(response.body));
      isSuccessStatus = deleteWishlistData.success.obs;
      print('Response Bool : ${deleteWishlistData.success}');
      print('isStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        print('Delete Wishlist True');
        deleteMsg = deleteWishlistData.message.obs;
        // Get.snackbar("Item is deleted from wishlist", "");

        userWishLists.clear();
        print('User Wish list Delete Length: ${userWishLists.length}');

        await getUserDetails();
      } else {
        print('Delete Wishlist False');
      }

    } catch(e){
      print('Delete Wishlist Error : $e');
    }
    isLoading(false);
  }


  Future<void> productAddToCart({required int qty, required int productId}) async {
    isLoading(true);
    String url = ApiUrl.AddToCartApi;
    print('Url : $url');
    print('productId : $productId');

    try {
      Map data = {
        "product_id": "$productId",
        "user_id": "$userId",
        "quantity": "$qty"
      };
      print('data123 : $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      AddToCartData addToCartData =
      AddToCartData.fromJson(json.decode(response.body));
      isSuccessStatus = addToCartData.success.obs;

      if (isSuccessStatus.value) {
        print('True True');
        Get.snackbar('${addToCartData.message}', '');
        Get.to(()=> CartScreen());
      } else {
        print('False False');
      }
    } catch (e) {
      print('Product Add To Cart Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    await getUserWishlistFunction(userId);
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

}