import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shoes_store/common/contants/user_details.dart';
import 'package:shoes_store/models/blog_detail_screen_model/blog_add_comment_model.dart';
import 'package:shoes_store/models/blog_detail_screen_model/blog_get_comment_model.dart';

import '../../common/api_url.dart';
import '../../models/blog_detail_screen_model/blog_detail_model.dart';


class BlogDetailController extends GetxController {
  int blogId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxString? blogImage;
  RxString? blogTitle;
  RxString? blogContent;
  RxString? date;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController commentController = TextEditingController();

  List<Datum> getBlogCommentList= [];


  getBlogDetailData() async{
    print('BlogId : $blogId');
    isLoading(true);
    String url = ApiUrl.BlogDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id" : "$blogId"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Blog Detail Response1 : ${response.statusCode}');
      print('Blog Detail Response2 : ${response.body}');

      BlogDetailsData blogDetailsData = BlogDetailsData.fromJson(json.decode(response.body));
      isStatus = blogDetailsData.success.obs;
      print('Response Bool : ${blogDetailsData.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        blogImage = blogDetailsData.data.image.obs;
        blogTitle = blogDetailsData.data.title.obs;
        blogContent = blogDetailsData.data.content.obs;
        date = "${blogDetailsData.data.createdDate.day}/${blogDetailsData.data.createdDate.month}/${blogDetailsData.data.createdDate.year}".obs;
      } else {
        print('Blog False False');
      }

    } catch(e) {
      print('Blog Detail Error : $e');
    } finally{
      // isLoading(false);
      getBlogCommentFunction();
    }

  }

  addBlogCommentFunction()async{
    print('BlogId : $blogId');
    isLoading(true);
    String url = ApiUrl.AddBlogCommentApi;
    print('Url : $url');

    try{
      Map data = {
        "comment" : commentController.text.trim(),
        "blog_id" : "$blogId",
        "id" : "${UserDetails.userId}"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      print('Blog Detail Response1 : ${response.statusCode}');
      print('Blog Detail Response2 : ${response.body}');

      BlogAddCommentModel blogAddCommentModel = BlogAddCommentModel.fromJson(json.decode(response.body));
      isStatus = blogAddCommentModel.success.obs;
      print('Response Bool : ${blogAddCommentModel.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        Fluttertoast.showToast(msg: blogAddCommentModel.message);
        commentController.clear();
      } else {
        print('Blog False False');
      }

    } catch(e) {
      print('Blog Add Comment Error : $e');
    }
    isLoading(false);
  }

  getBlogCommentFunction()async{
    print('BlogId : $blogId');
    isLoading(true);
    String url = ApiUrl.GetBlogCommentApi + "$blogId";
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      print('Blog Detail Response1 : ${response.statusCode}');
      print('Blog Detail Response2 : ${response.body}');

      BlogGetCommentModel blogGetCommentModel = BlogGetCommentModel.fromJson(json.decode(response.body));
      isStatus = blogGetCommentModel.success.obs;
      print('Response Bool : ${blogGetCommentModel.success}');
      print('isStatus : $isStatus');

      if(isStatus.value){
        getBlogCommentList= blogGetCommentModel.data;
        log('getBlogCommentList: $getBlogCommentList');
      } else {
        print('BlogComment False False');
      }

    } catch(e) {
      print('Blog Get Comment Error : $e');
    } finally{
      isLoading(false);
    }

  }

  @override
  void onInit() async {
    getBlogDetailData();
    super.onInit();
  }
}