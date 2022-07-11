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
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
            itemCount: blogScreenController.blogDataLists.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
                String date = "${blogScreenController.blogDataLists[index].createdDate.day}/"
                "${blogScreenController.blogDataLists[index].createdDate.month}/" +
                "${blogScreenController.blogDataLists[index].createdDate.year}";
                return Padding(
                  padding:  EdgeInsets.only(bottom: 10,top: index == 0 ? 12 : 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('id : ${blogScreenController.blogDataLists[index].id}');
                              Get.to(() => BlogDetailScreen(),
                                arguments: blogScreenController.blogDataLists[index].id,
                              );
                            },
                            child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: Get.height * 0.23,
                                width: Get.width,
                                image: NetworkImage(
                                    '${ApiUrl.ApiMainPath}${blogScreenController.blogDataLists[index].showimg}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                      date,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
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
                          // Html(
                          //   data: blogScreenController.blogDataLists[index].content,
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
            },
          ),
              ),
      ),
    );
  }
}
