import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Category", index: 2),
      body: Obx(
        () => categoryController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Expanded(
                    child: CategoryListModule(),
                  ),
                  Container()
                ],
              ),
      ),
    );
  }
}
