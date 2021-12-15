import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/custom_appbar.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/confirm_screen/confirm_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      appBar: commonAppBarModule(image: "Checkout"),

      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30),),
            color: Colors.white
        ),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              checkoutDetails(),

              SizedBox(height: 50,),
              checkoutButton()
            ],
          ),
        ),
      ),
    );
  }

  checkoutDetails(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: TextStyle(fontSize: 19, color: Colors.black),),
            Text("\$400", style: TextStyle(fontSize: 19, color: Colors.black),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount", style: TextStyle(fontSize: 19, color: Colors.black),),
            Text("\$50", style: TextStyle(fontSize: 19, color: Colors.black),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping", style: TextStyle(fontSize: 19, color: Colors.black),),
            Text("\$50", style: TextStyle(fontSize: 19, color: Colors.black),)
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Estimated Tax", style: TextStyle(fontSize: 19, color: Colors.black),),
            Text("\$50", style: TextStyle(fontSize: 19, color: Colors.black),)
          ],
        ),
      SizedBox(height: 10,),
        Divider(color: Colors.grey,),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
            Text("\$450", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)
          ],
        ),

        SizedBox(height: 10,),
        Divider(color: Colors.grey,),
      ],
    );
  }

  checkoutButton(){
    return GestureDetector(
      onTap: (){
        Get.to(ConfirmScreen());
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("Checkout", style: TextStyle(
            color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold
          ),),

        ),
      ),
    );
  }
}
