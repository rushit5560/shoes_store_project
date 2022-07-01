import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'images.dart';

class OrTextModule extends StatelessWidget {
  const OrTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
        SizedBox(
          width: 5,
        ),
        Text(
          "OR",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
      ],
    );
  }
}



class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.colorDarkPink,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}