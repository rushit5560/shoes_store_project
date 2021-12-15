import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:shoes_store/screens/checkout_screen/checkout_screen.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

   CartScreenController cartController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Cart"),

      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
          topRight: Radius.circular(30)),
          color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Expanded(child: cartList()),

            checkOutButton(),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }

  cartList(){
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 10
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 5,),
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
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10
                                    )
                                  ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          Images.ic_shoes1,
                                      ),fit: BoxFit.cover,),
                              ),
                            ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(

                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mens Shoes",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.black,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'lorem ipsum dolor sit amet , consectetur',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Obx(()=>
                                           Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  if (cartController.quant.value > 1) {
                                                    cartController.quant.value -= 1;
                                                    //setState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  height: 20,width: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.grey
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(width: 5),

                                              Text(
                                                '${cartController.quant.value}',
                                                style: TextStyle(
                                                    fontSize: 15
                                                ),
                                              ),

                                              SizedBox(width: 5),

                                              GestureDetector(
                                                onTap: (){
                                                  cartController.quant.value += 1;
                                                },
                                                child: Container(
                                                  height: 20,width: 20,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.grey
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '\$200',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.colorDarkPink,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '\$250',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.black,
                                              decoration: TextDecoration
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
                    Icon(Icons.delete, color: Colors.red,),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   checkOutButton(){
    return GestureDetector(
      onTap: (){
        Get.to(()=> CheckOutScreen());
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("Proceed To Checkout",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
   }
}
