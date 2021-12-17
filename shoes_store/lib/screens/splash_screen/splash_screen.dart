import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/controllers/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "" + "Shoes store",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ),
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
