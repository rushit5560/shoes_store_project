import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/models/category_collection_screen_model/category_collection_model.dart';


class CategoryCollectionScreenController extends GetxController{
  // categoryId & categoryName Getting From Category Screen
  int categoryId = Get.arguments[0];
  String categoryName = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<CategoryCollectionDetail> categoryCollectionLists = RxList();

  getCategoryCollectionData() async {
    log("categoryId : $categoryId");
    isLoading(true);
    String url = ApiUrl.CategoryCollectionApi;
    print('url : $url');

    try {
      Map data = {"id": "$categoryId"};

      http.Response response = await http.post(Uri.parse(url), body: data);

      CategoryCollectionModel categoryCollectionModel =
      CategoryCollectionModel.fromJson(json.decode(response.body));
      isStatus = categoryCollectionModel.success.obs;

      if (isStatus.value) {
        categoryCollectionLists = categoryCollectionModel.data.obs;
        log("categoryCollectionLists : ${categoryCollectionLists.length}");
      } else {
        print('CategoryCollection False False');
      }
    } catch (e) {
      print('CategoryCollection Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCategoryCollectionData();
    super.onInit();
  }
}