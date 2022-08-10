import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import '../../common/api_url.dart';
import '../../controllers/order_screen_controller/order_screen_controller.dart';
import '../order_detail_screen/order_detail_screen.dart';

class OrderScreen extends StatelessWidget {
  final orderScreenController = Get.put(OrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(image: "Orders"),
      body: Obx(() => orderScreenController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    orderScreenController.totalOrdersLists.isEmpty
                        ? Container(
                            height: Get.size.height / 1.2,
                            width: double.infinity,
                            child: Center(child: Text('No Data Available')))
                        : showOrderList(),
                  ],
                ),
              ),
            )),
    );
  }

  /*Widget dateShow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '10 Aug 2021',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }*/

  Widget showOrderList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orderScreenController.totalOrdersLists.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => OrderDetailScreen(),
                  arguments:
                      orderScreenController.totalOrdersLists[index].orderId);
              print(
                  'Order Id : ${orderScreenController.totalOrdersLists[index].orderId}');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 25.0,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                    "${orderScreenController.totalOrdersLists[index].userFname} "),
                                Expanded(
                                  child: Text(
                                    orderScreenController
                                        .totalOrdersLists[index].userLname,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].userStreetAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'City',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].userFname,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'State',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].userLname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Order Type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].orderType,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Total Qty',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].totalqty,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Total Amount',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          orderScreenController
                              .totalOrdersLists[index].totalprice,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          String invoiceLink =
                              "${ApiUrl.InvoicePdfPrefix}${orderScreenController.totalOrdersLists[index].orderPdf}${ApiUrl.InvoicePdfSuffix}";
                          print('invoiceLink : $invoiceLink');
                          print('invoiceLink');
                          openBrowserTab(invoiceLink);
                        },
                        child: Text(
                          'Order Invoice',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  openBrowserTab(url) async {
    await FlutterWebBrowser.openWebPage(url: url);
  }
}
