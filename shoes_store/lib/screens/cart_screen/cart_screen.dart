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
            ? Container(
                width: Get.width,
                height: Get.height,
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
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
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  CartItemListModule(),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Quantity",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${cartScreenController.cartData.totalqty}",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Subtotal",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "\$${cartScreenController.cartData.totalprice}",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20),

                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Discount",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     ),
                                        //     Text(
                                        //       "\$50",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(height: 20),

                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Shipping",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     ),
                                        //     Text(
                                        //       "\$50",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(height: 20),

                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Estimated Tax",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     ),
                                        //     Text(
                                        //       "\$50",
                                        //       style: TextStyle(fontSize: 19, color: Colors.black),
                                        //     )
                                        //   ],
                                        // ),
                                        // SizedBox(height: 10),

                                        Divider(color: Colors.grey),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "\$${cartScreenController.cartData.totalprice}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

                                        SizedBox(height: 10),
                                        Divider(color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
