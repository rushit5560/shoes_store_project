import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import '../../common/custom_appbar.dart';
import '../../controllers/blog_detail_screen_controller/blog_detail_controller.dart';
import 'blog_detail_screen_widgets.dart';

class BlogDetailScreen extends StatelessWidget {
  // const BlogDetailPage({Key? key}) : super(key: key);
  final blogDetailController = Get.put(BlogDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(image: "Blog Details"),

      body: Obx(
        ()=> blogDetailController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            BlogDetailsViewModule(),
            BlogCommentModule(),
          ],
        ),
      ),
    );
  }


}
