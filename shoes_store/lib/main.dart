import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/screens/cart_screen/cart_screen.dart';
import 'package:shoes_store/screens/change_password/change_password.dart';
import 'package:shoes_store/screens/new_category_screen/new_category_screen.dart';
import 'package:shoes_store/screens/splash_screen/splash_screen_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

