import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';

import '../../models/blog_screen/blogs_model.dart';

class BlogScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxList<Datum> blogDataLists = RxList();

  Future<void> getBlogDataFunction() async {
    isLoading(true);
    String url = ApiUrl.BlogsApi;
    log("Blogs Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      // print('Blog Response1 : ${response.statusCode}');
      // print('Blog Response2 : ${response.body}');

      BlogData blogData = BlogData.fromJson(json.decode(response.body));

      isSuccessStatus = blogData.success.obs;

      if(isSuccessStatus.value) {
        blogDataLists = blogData.data.obs;
      } else {
        log("getBlogDataFunction Else Else");
      }

    } catch(e) {
      log("getBlogDataFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getBlogDataFunction();
    super.onInit();
  }
}