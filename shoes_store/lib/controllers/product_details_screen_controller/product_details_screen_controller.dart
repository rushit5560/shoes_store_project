import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/models/product_detail_screen_model/add_product_review_model.dart';
import 'package:shoes_store/models/product_detail_screen_model/addtocart_model.dart';
import 'package:shoes_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:shoes_store/models/product_detail_screen_model/product_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/models/product_detail_screen_model/related_products_model.dart';
import 'package:shoes_store/screens/cart_screen/cart_screen.dart';

import '../../models/product_detail_screen_model/addproduct_wishlist_model.dart';

class ProductDetailsScreenController extends GetxController {
  int productId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt activeIndex = 0.obs;
  int productQty = 1;

  RxBool isProductWishLishes = false.obs;
  RxList<Datum> productDetailLists = RxList();
  List<RelatedProductDatum> relatedProductLists = [];

  final GlobalKey<FormState> productReviewFormKey = GlobalKey<FormState>();
  final TextEditingController productReviewFieldController =
      TextEditingController();
  // RxList<Datum1> productReviewList = RxList();
  var userId;

  RxString? wishListData;

  RxDouble rating = 0.0.obs;

  getProductDetailData() async {
    isLoading(true);
    String url = ApiUrl.ProductDetailApi;
    print('Url : $url');

    try {
      Map data = {"id": "$productId"};
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      log("response : ${response.body}");

      ProductDetailsData productDetailsData =
          ProductDetailsData.fromJson(json.decode(response.body));
      isStatus = productDetailsData.success.obs;

      if (isStatus.value) {
        productDetailLists = productDetailsData.data.obs;
        log("productDetailsScreenController.productDetailLists[0].outofStockStatus : ${productDetailLists[0].outofStockStatus}");
      } else {
        print('Product Details False False');
      }
    } catch (e) {
      print('Product Details Error : $e');
    } finally {
      // isLoading(false);
      await getRelatedProductFunction();
      // getProductReview();
    }
  }

  /*getProductReview() async {
    isLoading(true);
    String url = ApiUrl.ProductReviewApi;
    print('Url : $url');

    try {
      Map data = {"productid": "$productId"};
      print('data : $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      ProductReviewData productReviewData =
          ProductReviewData.fromJson(json.decode(response.body));

      isStatus = productReviewData.success.obs;

      if (isStatus.value) {
        productReviewList.clear();
        productReviewList = productReviewData.data.obs;
        print('productReviewList : $productReviewList');
      } else {
        print('Product Review False False');
      }
    } catch (e) {
      print('Product Review Error : $e');
    } finally {
      isLoading(false);
    }
  }*/

  addProductReview() async {
    isLoading(true);
    String url = ApiUrl.AddProductReviewApi;
    print('Url : $url');
    print('productId : $productId');

    try {
      Map data = {
        "userid": "$userId",
        "productid": "$productId",
        "ratings": rating.toString(),
        "comment": productReviewFieldController.text.trim()
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      AddProductReviewData addProductReviewData =
          AddProductReviewData.fromJson(json.decode(response.body));
      isStatus = addProductReviewData.success.obs;

      if (isStatus.value) {
        Fluttertoast.showToast(
            msg: "${addProductReviewData.message.toString()}");
        productReviewFieldController.clear();
      } else {
        print('Else False');
      }
    } catch (e) {
      print('Add Product Review False');
    } finally {
      isLoading(false);
      // getProductReview();
    }
  }

  Future<void> productAddToCart({required int qty}) async {
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
      isStatus = addToCartData.success.obs;

      if (isStatus.value) {
        print('True True');
        Get.snackbar('${addToCartData.message}', '');
        Get.to(() => CartScreen());
      } else {
        print('False False');
      }
    } catch (e) {
      print('Product Add To Cart Error : $e');
    } finally {
      isLoading(false);
    }
  }

  addProductWishlistFunction(int productId) async {
    isLoading(true);
    String url = ApiUrl.AddProductWishlistApi;
    print('Url : $url');

    try {
      Map data = {"id": "$userId", "product_id": "$productId"};

      print('wishlist data : $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      print('AddWishlist Response1 : ${response.statusCode}');
      print('AddWishlist Response2 : ${response.body}');

      AddProductWishlistData addProductWishlistData =
          AddProductWishlistData.fromJson(json.decode(response.body));
      isStatus = addProductWishlistData.success.obs;
      print('Response Bool : ${addProductWishlistData.success}');
      print('isStatus : $isStatus');

      if (isStatus.value) {
        print('AddWishlist True True');
        wishListData = addProductWishlistData.data.obs;
        // Get.snackbar('title', "${wishListData.toString()}");

        if (addProductWishlistData.data.contains('already added in wishlist')) {
          Get.snackbar('Product Already Added in Wishlist.', '');
        } else {
          Get.snackbar('Product Added in Wishlist.', '');
        }

        // Get.to(() => WishListPage());
      } else {
        print('AddWishlist False False');
      }
    } catch (e) {
      print('Add WishList Error : $e');
    }

    isLoading(false);
  }

  Future<void> getRelatedProductFunction() async {
    isLoading(true);
    String url = ApiUrl.GetRelatedProductsApi + "$productId";
    log('Related product list url : $url');
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('Related product response: ${response.body}');

      RelatedProductsModel relatedProductsModel =
          RelatedProductsModel.fromJson(json.decode(response.body));
      isStatus = relatedProductsModel.success.obs;

      if (isStatus.value) {
        //relatedProductLists.clear();
        relatedProductLists = relatedProductsModel.data;
        log("relatedProductLists : ${relatedProductLists.length}");
      } else {
        log("getRelatedProductFunction Else Else");
      }
    } catch (e) {
      log("getRelatedProductFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getProductDetailData();
    getUserDetailFromPrefs();
    super.onInit();
  }

  getUserDetailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id').toString();
    print('UserId : $userId');
  }
}
