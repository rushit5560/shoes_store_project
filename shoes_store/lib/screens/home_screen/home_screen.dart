import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/common_functions.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_drawer/custom_drawer.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());
  CommonFunctions commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: Image.asset(Images.ic_logo), index: 1),
      drawer: CustomDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : GestureDetector(
                onTap: () => commonFunctions.hideKeyBoard(),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        SearchTextFieldModule(),
                        const SizedBox(height: 20),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            color: AppColors.colorWhite,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ImageBannerModule(),
                              // ImageBannerIndicator(),
                              const SizedBox(height: 10),
                              NewCollectionListModule(),
                              const SizedBox(height: 20),
                              // BestSellerListModule(),
                              // const SizedBox(height: 25),
                              TestimonialModule(),
                              const SizedBox(height: 25),
                              // BrandBannerModule(),
                              // SizedBox(height: 10),
                              // OfferListModule(),
                              // const SizedBox(height: 15),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
