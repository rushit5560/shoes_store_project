import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Cart"),
      body: Obx(
        () => cartScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                        child: cartScreenController.userCartProductLists.isEmpty
                        ? Center(child: Text("No items available in cart"))
                        : CartItemListModule(),
                    ),
                    cartScreenController.userCartProductLists.isEmpty
                    ? Container()
                    : CheckOutButtonModule(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }

}
