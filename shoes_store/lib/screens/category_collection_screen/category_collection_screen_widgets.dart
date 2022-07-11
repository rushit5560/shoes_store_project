import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:shoes_store/models/category_collection_screen_model/category_collection_model.dart';
import 'package:shoes_store/screens/product_details_screen/product_details_screen.dart';

class CategoryCollectionListModule extends StatelessWidget {
  CategoryCollectionListModule({Key? key}) : super(key: key);
  final categoryCollectionScreenController =
      Get.find<CategoryCollectionScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: categoryCollectionScreenController.categoryCollectionLists.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 1/1.3,
            mainAxisSpacing: 20
        ),
        itemBuilder: (BuildContext context, int index) {
          CategoryCollectionDetail categoryCollectionSingleItem =
              categoryCollectionScreenController.categoryCollectionLists[index];
          return _categoryListTile(categoryCollectionSingleItem);
        },
      ),
    );
  }

  Widget _categoryListTile(CategoryCollectionDetail categoryCollectionSingleItem) {
    final imgUrl =
        ApiUrl.ApiMainPath + "${categoryCollectionSingleItem.showimg}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailsScreen(),
                arguments: categoryCollectionSingleItem.id,
              );
            },
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network("$imgUrl", fit: BoxFit.cover),

                  SizedBox(height: 10),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${categoryCollectionSingleItem.productname}",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$${categoryCollectionSingleItem.productcost}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
