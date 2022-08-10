import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/common_functions.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/custom_drawer/custom_drawer.dart';
import 'package:shoes_store/common/custom_widgets.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:shoes_store/models/collection_screen_model/collection_model.dart';
import 'package:shoes_store/screens/product_details_screen/product_details_screen.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({Key? key}) : super(key: key);

  final collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Product", index: 4),
      // drawer: CustomDrawer(),
      body: Obx(
        () => collectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Column(
                children: [
                  const SizedBox(height: 10),
                  searchTextFieldModule(),
                  const SizedBox(height: 15),
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
                          Expanded(
                              child: collectionScreenController
                                      .searchCollectionLists.isNotEmpty
                                  ? searchCollectionListModule()
                                  : collectionList())
                        ],
                      ),
                    ),
                  ),
                  //Container()
                ],
              ),
      ),
    );
  }

  Widget searchTextFieldModule() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: collectionScreenController.categorySearchFieldController,

        // obscureText: true,
        decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: GestureDetector(
            onTap: () {
              log('Collection Name : ${collectionScreenController.categorySearchFieldController.text}');
              if (collectionScreenController.categorySearchFieldController.text
                  .trim()
                  .isEmpty) {
                collectionScreenController.isLoading(true);
                collectionScreenController.searchCollectionLists.clear();
                collectionScreenController.isLoading(false);
                // screenController.loadUI();
              } else {
                collectionScreenController.searchCollectionListFunction();
                collectionScreenController.categorySearchFieldController
                    .clear();
              }
              CommonFunctions().hideKeyBoard();
            },
            child: Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
          //prefixIcon: Icon(icon, color: Colors.black),
          // isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.white)),
        ),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (val) {
          log('Collection Name : ${collectionScreenController.categorySearchFieldController.text}');
          if (collectionScreenController.categorySearchFieldController.text
              .trim()
              .isEmpty) {
            collectionScreenController.isLoading(true);
            collectionScreenController.searchCollectionLists.clear();
            collectionScreenController.isLoading(false);
            // screenController.loadUI();
          } else {
            collectionScreenController.searchCollectionListFunction();
            collectionScreenController.categorySearchFieldController.clear();
          }
          CommonFunctions().hideKeyBoard();
        },

        //validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }

  collectionList() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: collectionScreenController.collectionLists.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          Datum1 categorySingleItem =
              collectionScreenController.collectionLists[index];
          return _collectionListTile(categorySingleItem, index);
        },
      ),
    );
  }

  Widget _collectionListTile(Datum1 categorySingleItem, int index) {
    final imgUrl = ApiUrl.ApiMainPath + "${categorySingleItem.showimg}";
    print(imgUrl);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => ProductDetailsScreen(),
                arguments: categorySingleItem.id,
              );
            },
            child: Container(
              //height: 100,
              width: Get.width,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.grey.shade200,
                //border: Border.all(color: Colors.grey.shade400
                //),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "$imgUrl",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Stack(
                      children: [
                        Image.asset(
                          Images.noApiPhoto,
                          color: Colors.white,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: Text(
                              "No Image",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${categorySingleItem.productname}",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                "\$${categorySingleItem.productcost}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  "\$${categorySingleItem.productcost}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  searchCollectionListModule() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        itemCount: collectionScreenController.searchCollectionLists.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          // Datum categorySingleItem =
          // collectionScreenController.searchCollectionLists[index];
          return _searchCollectionListTile(index);
        },
      ),
    );
  }

  Widget _searchCollectionListTile(index) {
    final imgUrl = ApiUrl.ApiMainPath +
        "asset/uploads/product/${collectionScreenController.searchCollectionLists[index].showimg}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => ProductDetailsScreen(),
                arguments:
                    collectionScreenController.searchCollectionLists[index].id,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "$imgUrl",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${collectionScreenController.searchCollectionLists[index].productname}",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                "\$${collectionScreenController.searchCollectionLists[index].productcost}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "\$${collectionScreenController.searchCollectionLists[index].productcost}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
