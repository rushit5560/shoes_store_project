import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'category_collection_screen_widgets.dart';

class CategoryCollectionScreen extends StatelessWidget {
  CategoryCollectionScreen({Key? key}) : super(key: key);
  final categoryCollectionScreenController =
      Get.put(CategoryCollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(
          image: "${categoryCollectionScreenController.categoryName}",
          context: context),
      body: Obx(
        () => categoryCollectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Expanded(
                            child: categoryCollectionScreenController
                                    .categoryCollectionLists.isEmpty
                                ? Center(child: Text("No Data Available!"))
                                : CategoryCollectionListModule(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
      ),
    );
  }
}
