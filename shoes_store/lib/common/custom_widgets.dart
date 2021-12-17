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

class LoginWithFacebookModule extends StatelessWidget {
  const LoginWithFacebookModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkBlue),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.ic_facebook),
            SizedBox(
              width: 10,
            ),
            Text(
              "Login WIth Facebook",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class LoginWithGoogleModule extends StatelessWidget {
  const LoginWithGoogleModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorDarkRed),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.ic_google),
            SizedBox(
              width: 10,
            ),
            Text(
              "Login WIth Google",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
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