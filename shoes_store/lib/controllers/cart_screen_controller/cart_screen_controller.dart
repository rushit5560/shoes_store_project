import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/models/cart_screen_model/add_cart_qty.dart';
import 'package:shoes_store/models/cart_screen_model/cart_model.dart';
import 'package:shoes_store/models/cart_screen_model/delete_cart_product_model.dart';

class CartScreenController extends GetxController {
  // RxInt quant = 1.obs;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Cartditeil> userCartProductLists = RxList();
  Cart cartData = Cart();
  RxInt userCartId = 0.obs;
  // RxInt userCartTotalAmount = 0.obs;

  Future<void> getUserCartData(userId) async {
    isLoading(true);
    String url = ApiUrl.UserCartApi;
    print('Url : $url');

    try {
      Map data = {"user_id": "$userId"};
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      UserCartData userCartData =
          UserCartData.fromJson(json.decode(response.body));
      isStatus = userCartData.success.obs;

      if (isStatus.value) {
        userCartProductLists.clear();
        cartData = userCartData.data.cart;
        userCartProductLists = userCartData.data.cartditeil.obs;
        userCartId = userCartData.data.cart.cartId!.obs;
        // userCartTotalAmount = userCartData.data.cart.totalprice.obs;
      } else {
        print('User Cart False');
      }
    } catch (e) {
      print('User Cart Data Error : $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAddProductCartQty(quantity, cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.AddCartQtyApi;
    print('Url : $url');

    try {
      Map data = {"qty": "$quantity", "cid": "$cartDetailId"};
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddCartQtyData addCartQtyData =
          AddCartQtyData.fromJson(json.decode(response.body));
      isStatus = addCartQtyData.success.obs;

      if (isStatus.value) {
        Get.snackbar("Cart quantity is updated. ", '');
      } else {
        print('Add Qty False');
      }
    } catch (e) {
      print('Add Product Qty Error : $e');
    } finally {
      getUserDetailsFromPrefs();
    }
  }

  Future<void> getDeleteProductCart(cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.DeleteCartProductApi;
    print('Url : $url');

    try {
      Map data = {"id": "$cartDetailId"};
      http.Response response = await http.post(Uri.parse(url), body: data);
      DeleteCartProductData deleteCartProductData =
          DeleteCartProductData.fromJson(json.decode(response.body));
      isStatus = deleteCartProductData.success.obs;
      if (isStatus.value) {
        Get.snackbar('Successfully Deleted Cart Item', '');
      } else {
        print('DeleteCartProductData False False');
      }
    } catch (e) {
      print('DeleteCartProductData Error : $e');
    } finally {
      getUserDetailsFromPrefs();
    }
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    await getUserCartData(userId1);
  }
}
