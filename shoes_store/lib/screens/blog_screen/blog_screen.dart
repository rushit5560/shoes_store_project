import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../common/api_url.dart';
import '../../common/custom_appbar.dart';
import '../../controllers/blog_screen_controller/blog_screen_controller.dart';
import '../blog_detail_screen/blog_detail_screen.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({Key? key}) : super(key: key);
  final blogScreenController = Get.put(BlogScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(image: "Blogs"),

      body: Obx(
          ()=> blogScreenController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: blogScreenController.blogDataLists.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            print('id : ${blogScreenController.blogDataLists[index].id}');
                            Get.to(() => BlogDetailScreen(),
                              arguments: blogScreenController.blogDataLists[index].id,
                            );
                          },
                          child: Image(
                            height: Get.height * 0.23,
                            width: Get.width,
                            image: NetworkImage(
                                '${ApiUrl.ApiMainPath}${blogScreenController.blogDataLists[index].showimg}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          blogScreenController.blogDataLists[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Html(
                        data: blogScreenController.blogDataLists[index].content,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }
}
