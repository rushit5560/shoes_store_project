import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/api_url.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:shoes_store/models/cart_screen_model/cart_model.dart';
import 'package:shoes_store/screens/checkout_screen/checkout_screen.dart';

class CartItemListModule extends StatelessWidget {
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: cartScreenController.userCartProductLists.length,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Cartditeil cartSingleItem =
              cartScreenController.userCartProductLists[index];
          return _cartItemListTile(cartSingleItem);
        },
      ),
    );
  }

  Widget _cartItemListTile(Cartditeil cartSingleItem) {
    final imgUrl = ApiUrl.ApiMainPath +
        "asset/uploads/product/" +
        "${cartSingleItem.showimg}";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                                "${cartSingleItem.productname}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${cartSingleItem.fullText}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartSingleItem.cquantity > 1) {
                                              var cartItemDec =
                                                  cartSingleItem.cquantity - 1;
                                              await cartScreenController.getAddProductCartQty(
                                                cartItemDec,
                                                cartSingleItem.cartDetailId,
                                              );
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.grey),
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${cartSingleItem.cquantity}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () async {
                                            var cartItemInc = cartSingleItem.cquantity + 1;
                                            await cartScreenController.getAddProductCartQty(
                                              cartItemInc,
                                              cartSingleItem.cartDetailId,
                                            );
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Colors.grey,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  const SizedBox(width: 10),
                                  Text(
                                    '\$${cartSingleItem.productcost}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.colorDarkPink,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '\$${cartSingleItem.productcost}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.black,
                                        decoration: TextDecoration.lineThrough),
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
              GestureDetector(
                onTap: () => cartScreenController
                    .getDeleteProductCart(cartSingleItem.cartDetailId),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 5)
            ],
          ),
        ),
      ),
    );
  }
}


class CheckOutButtonModule extends StatelessWidget {
  const CheckOutButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CheckOutScreen());
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Proceed To Checkout",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
