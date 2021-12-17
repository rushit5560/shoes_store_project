import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:shoes_store/models/collection_screen_model/collection_model.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({Key? key}) : super(key: key);

  final collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "New Category", index: 2),
      body: Obx(
        () => collectionScreenController.isLoading.value
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
                          Expanded(child: categoryList())
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

  categoryList() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: collectionScreenController.collectionLists.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          Datum1 categorySingleItem =
              collectionScreenController.collectionLists[index];
          return _categoryListTile(categorySingleItem);
        },
      ),
    );
  }

  Widget _categoryListTile(Datum1 categorySingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + "${categorySingleItem.showimg}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              //height: 100,
              width: Get.width,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200,
                  //border: Border.all(color: Colors.grey.shade400
                  //),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 5)
                  ]),
              child: Image.network("$imgUrl"),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "${categorySingleItem.productname}",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              "\$${categorySingleItem.productcost}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10),
            Text(
              "\$${categorySingleItem.productcost}",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
