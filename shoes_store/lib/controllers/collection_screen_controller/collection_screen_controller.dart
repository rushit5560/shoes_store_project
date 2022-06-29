import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/models/collection_screen_model/collection_model.dart';
import 'package:http/http.dart' as http;

class CollectionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum1> collectionLists = [];
  List<Datum1> searchCollectionLists = [];

  TextEditingController categorySearchFieldController = TextEditingController();

  getCollectionData() async {
    isLoading(true);
    String url = ApiUrl.ProductApi;
    print('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      ProductData productData = ProductData.fromJson(json.decode(response.body));
      isStatus = productData.success.obs;

      if(isStatus.value) {
        collectionLists = productData.data;
      } else {
        print('Collection False False');
      }
    } catch(e) {
      print('Collection Error : $e');
    } finally {
      isLoading(false);
    }
  }

  searchCollectionListFunction() async {
    isLoading(true);
    //String url = ApiUrl.SearchRestaurantApi;
    //log("Search Restaurant API URL : $url");

    try {
      Map<String, dynamic> data = {
        "searchdata" : "${categorySearchFieldController.text.trim().toString()}",
      };
      log("data : $data");

      //http.Response response = await http.post(Uri.parse(url), body: data);

     // SearchRestaurantModel searchRestaurantModel = SearchRestaurantModel.fromJson(json.decode(response.body));
     // isStatus = searchRestaurantModel.status.obs;
      log("isStatus : $isStatus");

      if(isStatus.value) {
        searchCollectionLists.clear();

        /// Only Active Store Add in List
        // for(int i = 0; i < searchRestaurantModel.store.length; i++) {
        //   if(searchRestaurantModel.store[i].isActive == true) {
        //     searchCollectionLists.add(searchRestaurantModel.store[i]);
        //   }
        // }
        log("searchCollectionLists Length : ${searchCollectionLists.length}");
        if(searchCollectionLists.length == 0) {
          Fluttertoast.showToast(msg: "Search Food Not Available!");
        }
      } else {
        log("searchRestaurantListFunction Else Else");
      }

    } catch(e) {
      log("searchRestaurantListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getCollectionData();
    super.onInit();
  }

}