import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/screens/confirm_screen/confirm_screen.dart';
import '../../controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'checkout_screen_widgets.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);
  final checkOutScreenController = Get.put(CheckOutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Checkout"),
      body: Obx(
        () => checkOutScreenController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BillingDetailsModule(),
                              const SizedBox(height: 10),
                              Text(
                                'Payment Method',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GridView.builder(
                                itemCount: checkOutScreenController
                                    .paymentMethodList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        print('$index');
                                        checkOutScreenController
                                            .isSelectedIndex.value = index;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: checkOutScreenController
                                                          .isSelectedIndex
                                                          .value ==
                                                      index
                                                  ? AppColors.colorDarkPink
                                                  : Colors.grey),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 5,
                                              left: 5,
                                              child: checkOutScreenController
                                                          .isSelectedIndex
                                                          .value ==
                                                      index
                                                  ? Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                1),
                                                        child: Icon(
                                                            Icons.check_rounded,
                                                            color: Colors.white,
                                                            size: 15),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .colorDarkPink,
                                                      ),
                                                    )
                                                  : Container(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        '${checkOutScreenController.paymentMethodList[index].img}'),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      '${checkOutScreenController.paymentMethodList[index].name}'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        checkoutButton(),
                      ],
                    ),
                  ),
                ),
                // child: Container(
                //   margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                //   child: Column(
                //     children: [
                //       // checkoutDetails(),
                //       SizedBox(height: 50),
                //       checkoutButton(),
                //     ],
                //   ),
                // ),
              ),
      ),
    );
  }

  // checkoutDetails() {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Subtotal",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           ),
  //           Text(
  //             "\$${cartScreenController.cartData.totalprice}",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           )
  //         ],
  //       ),
  //       SizedBox(height: 20),
  //
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Discount",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           ),
  //           Text(
  //             "\$50",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           )
  //         ],
  //       ),
  //       SizedBox(height: 20),
  //
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Shipping",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           ),
  //           Text(
  //             "\$50",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           )
  //         ],
  //       ),
  //       SizedBox(height: 20),
  //
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Estimated Tax",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           ),
  //           Text(
  //             "\$50",
  //             style: TextStyle(fontSize: 19, color: Colors.black),
  //           )
  //         ],
  //       ),
  //       SizedBox(height: 10),
  //
  //       Divider(color: Colors.grey),
  //       SizedBox(height: 10),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Total",
  //             style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           Text(
  //             "\$${cartScreenController.cartData.totalprice}",
  //             style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold),
  //           )
  //         ],
  //       ),
  //
  //       SizedBox(height: 10),
  //       Divider(color: Colors.grey),
  //     ],
  //   );
  // }

  checkoutButton() {
    return GestureDetector(
      onTap: () async {
        if(checkOutScreenController.checkoutFormKey.currentState!.validate()) {
          if(checkOutScreenController.countryDropDownValue!.name == "Select Country") {
            Fluttertoast.showToast(msg: "Please select country");
          } else {
            await checkOutScreenController.addOrderFunction();
          }
        }

      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Proceed To Payment",
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
