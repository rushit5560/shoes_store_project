import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import '../../common/custom_appbar.dart';
import '../../controllers/blog_detail_screen_controller/blog_detail_controller.dart';

class BlogDetailScreen extends StatelessWidget {
  // const BlogDetailPage({Key? key}) : super(key: key);
  final blogDetailController = Get.put(BlogDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(image: "Blog Details"),

      body: blogDetailView(),
    );
  }

  Widget blogDetailView() {
    return Obx(
      ()=> blogDetailController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '${ApiUrl.ApiMainPath}${blogDetailController.blogImage}',
                ),
                fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              blogDetailController.blogTitle!.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Html(
                data: blogDetailController.blogContent!.value
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
