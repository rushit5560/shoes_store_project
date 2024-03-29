import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/app_colors.dart';
import 'package:shoes_store/common/images.dart';
import 'package:shoes_store/screens/index_screen/index_screen.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Images.ic_right),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Congratulations",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Your payment is completed ",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Please check your delivery status",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(
                            () => IndexScreen(),
                            transition: Transition.zoom,
                          );
                        },
                        child: Container(
                          height: 45,
                          width: Get.width / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Continue Shopping",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // GestureDetector(
                //   onTap: (){
                //     Get.back();
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(right: 40, top: 15),
                //     height: 20, width: 20,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.black
                //     ),
                //     child: Center(child: Icon(Icons.close, color: Colors.white, size: 15)),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
