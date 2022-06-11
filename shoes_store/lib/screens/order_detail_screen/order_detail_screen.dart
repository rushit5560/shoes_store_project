import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';

import '../../controllers/order_detail_screen_controller/order_detail_controller.dart';

class OrderDetailScreen extends StatelessWidget {
  // const OrderDetailPage({Key? key}) : super(key: key);
  OrderDetailController orderDetailController =
      Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(image: "Details"),
      body: Obx(() => orderDetailController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.colorDarkRed,
                backgroundColor: Colors.grey,
              ),
            )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Product Name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${orderDetailController.orderDetailLists[0].productname}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Order Quantity",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${orderDetailController.orderDetailLists[0].quantity}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Product Amount",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${orderDetailController.orderDetailLists[0].totalCost}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${orderDetailController.orderDetailLists[0].totalCost}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Order Date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "${orderDetailController.orderDetailLists[0].createdDate}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
          ),
      ),
    );
  }
}
