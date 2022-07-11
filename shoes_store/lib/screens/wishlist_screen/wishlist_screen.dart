import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/custom_appbar.dart';

import '../../common/api_url.dart';
import '../../controllers/wishlist_screen_controller/wishlist_screen_controller.dart';

class WishlistScreen extends StatefulWidget {
  WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final wishlistScreenController = Get.put(WishlistScreenController());

  @override
  void initState() {
    wishlistScreenController.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(image: "Wishlist"),
      body: Obx(
        () => wishlistScreenController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : wishlistScreenController.userWishLists.isEmpty
                ? Center(
                    child: Text("No Data Available!"),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: ListView.builder(
                      itemCount: wishlistScreenController.userWishLists.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(15),
                            elevation: 4,
                            child: Container(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Container(
                                                  height: 65,
                                                  width: 65,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${ApiUrl.ApiMainPath}${wishlistScreenController.userWishLists[index].showimg}'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          wishlistScreenController
                                                              .userWishLists[
                                                                  index]
                                                              .productname,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      /*Text(
                                                  'Color : ${wishlistItems[index].productColor}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 5),*/
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '\$${wishlistScreenController.userWishLists[index].productcost}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16,
                                                              // color: CustomColor.kOrangeColor,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            '\$${wishlistScreenController.userWishLists[index].productcost}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.red,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                print(
                                                    'wishlistid : ${wishlistScreenController.userWishLists[index].wishlistid}');
                                                await wishlistScreenController
                                                    .getDeleteWishlistFunction(
                                                        wishlistScreenController
                                                            .userWishLists[
                                                                index]
                                                            .wishlistid);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Icon(
                                                      Icons.close_rounded,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        AppColors.colorDarkPink,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  var productId =
                                                      wishlistScreenController
                                                          .userWishLists[index]
                                                          .productId;
                                                  var wishlistId =
                                                      wishlistScreenController
                                                          .userWishLists[index]
                                                          .wishlistid;

                                                  await wishlistScreenController
                                                      .getDeleteWishlistFunctionNew(
                                                          wishlistId);

                                                  await wishlistScreenController
                                                      .productAddToCart(
                                                    qty: 1,
                                                    productId: productId,
                                                  );
                                                },
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      size: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        AppColors.colorDarkPink,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 30, width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.colorDarkPink,
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(Icons.shopping_cart_rounded),
                                        color: Colors.white,
                                        iconSize: 15,
                                        onPressed: () {
                                          // print(wishListController.userWishLists[index].productname);
                                        },
                                      ),
                                    ),
                                  ),
                                ),*/
                                    ],
                                  ),
                                  /*Positioned(
                          right: 15,
                          top: -7,
                          child: GestureDetector(
                            onTap: () async{
                              print('wishlistid : ${wishlistScreenController.userWishLists[index].wishlistid}');
                              await wishlistScreenController.getDeleteWishlistFunction(wishlistScreenController.userWishLists[index].wishlistid);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colorDarkPink,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 15,
                          bottom: -7,
                          child: Container(
                            height: 30, width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colorDarkPink,
                            ),
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.shopping_cart_rounded),
                                color: Colors.white,
                                iconSize: 15,
                                onPressed: () {
                                  // print(wishListController.userWishLists[index].productname);
                                },
                              ),
                            ),
                          ),
                        ),*/
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
