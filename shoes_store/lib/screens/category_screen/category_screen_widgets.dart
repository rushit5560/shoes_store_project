import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:shoes_store/models/category_screen_model/category_model.dart';
import 'package:shoes_store/screens/category_collection_screen/category_collection_screen.dart';

class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final categoryController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: ListView.builder(
        itemCount: categoryController.categoryLists.length,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Datum categorySingleItem = categoryController.categoryLists[index];
          return _categoryListTile(categorySingleItem);
        },
      ),
    );
  }

  Widget _categoryListTile(Datum categorySingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + "${categorySingleItem.showimg}";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(()=> CategoryCollectionScreen(),
            arguments: [
              categorySingleItem.categoryId,
              categorySingleItem.categoryName,
            ],
          );
        },
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade500, blurRadius: 10)
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 10)
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage("$imgUrl"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${categorySingleItem.categoryName}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.black,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "1020 item",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.colorDarkPink),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
