import 'dart:convert';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/models/home_screen_model/banner_model.dart';
import 'package:shoes_store/models/home_screen_model/category_model.dart';
import 'package:shoes_store/models/home_screen_model/featured_product_model.dart';
import 'package:shoes_store/models/home_screen_model/testimonial_data_model.dart';


class HomeScreenController extends GetxController{
  var activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<BannerElement> bannerLists = RxList();
  RxList<ProductElement> featuredProductLists = RxList();
  RxList<TestimonialElement> testimonialLists = RxList();
  RxList<CategoryElement> categoryLists = RxList();

  Future<void> getBannerDataFunction() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      GetAllBannerModel getAllBannerModel = GetAllBannerModel.fromJson(json.decode(response.body));
      isStatus = getAllBannerModel.status.obs;

      if(isStatus.value){
        bannerLists.clear();
        bannerLists = getAllBannerModel.list.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      // isLoading(false);
      await getFeaturedProductDataFunction();
    }

  }

  Future<void> getFeaturedProductDataFunction() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      AllProductsModel allProductsModel = AllProductsModel.fromJson(json.decode(response.body));
      isStatus = allProductsModel.status.obs;

      if(isStatus.value) {
        featuredProductLists = allProductsModel.list.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      // isLoading(false);
      await getTestimonialDataFunction();
    }
  }

  Future<void> getTestimonialDataFunction() async {
    isLoading(true);
    String url = ApiUrl.TestimonialApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      GetTestimonialModel getTestimonialModel = GetTestimonialModel.fromJson(json.decode(response.body));
      isStatus = getTestimonialModel.status.obs;

      if(isStatus.value) {
        testimonialLists.clear();
        testimonialLists = getTestimonialModel.list.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      // isLoading(false);
      await getCategoryDataFunction();
    }
  }

  Future<void> getCategoryDataFunction() async {
    isLoading(true);
    String url = ApiUrl.CategoryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      GetAllCategoryModel getAllCategoryModel = GetAllCategoryModel.fromJson(json.decode(response.body));
      isStatus = getAllCategoryModel.status.obs;

      if(isStatus.value) {
        categoryLists.clear();
        categoryLists = getAllCategoryModel.list.obs;
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
    getBannerDataFunction();
    super.onInit();
  }

}