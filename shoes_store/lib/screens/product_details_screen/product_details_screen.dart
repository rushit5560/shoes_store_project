import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'product_details_screen_widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);
  final productDetailsScreenController =
      Get.put(ProductDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar:
          commonAppBarModule(image: "Product detail", context: context),
      body: Obx(
        () => productDetailsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ProductImageSliderModule(),
                      ProductImageSliderIndicatorModule(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                          ),
                          color: Colors.white),
                      child: ProductDetailsModule(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

}
