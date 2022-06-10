import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';

import '../../common/api_url.dart';
import '../../controllers/wishlist_screen_controller/wishlist_screen_controller.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({Key? key}) : super(key: key);
  final wishlistScreenController = Get.put(WishlistScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(image: "Wishlist"),
      body: Obx(
        ()=> wishlistScreenController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: wishlistScreenController.userWishLists.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 10,
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '${ApiUrl.ApiMainPath}${wishlistScreenController.userWishLists[index].showimg}'
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              wishlistScreenController.userWishLists[index].productname,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 18),
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
                                            children: [
                                              Text(
                                                '\$${wishlistScreenController.userWishLists[index].productcost}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  // color: CustomColor.kOrangeColor,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '\$${wishlistScreenController.userWishLists[index].productcost}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    decoration: TextDecoration.lineThrough
                                                ),
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
                          /*Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 35, width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColor.kOrangeColor,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.shopping_cart_rounded),
                                    color: Colors.white,
                                    iconSize: 20,
                                    onPressed: () {
                                      print(wishListController.userWishLists[index].productname);
                                    },
                                  ),
                                ),
                              ),*/
                        ],
                      ),
                      Positioned(
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
                              // color: CustomColor.kOrangeColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
