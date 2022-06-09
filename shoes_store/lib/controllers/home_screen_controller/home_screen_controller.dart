import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/images.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/models/home_screen_model/banner_model.dart';
import 'package:shoes_store/models/home_screen_model/featured_product_model.dart';
class HomeScreenController extends GetxController{
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Datum> bannerLists = RxList();
  RxList<Datum1> featuredProductLists = RxList();

  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
        log('bannerLists: $bannerLists');
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      // isLoading(false);
      getFeaturedProductData();
    }

  }

  getFeaturedProductData() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      FeaturedProductData featuredProductData = FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;

      if(isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }

}