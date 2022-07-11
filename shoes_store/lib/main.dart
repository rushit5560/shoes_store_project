import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor accentColorSwatch = const MaterialColor(
    0xFFf04f01,
    const {
      50: const Color(0xFFfeede6),
      100: const Color(0xFFfbcab3),
      200: const Color(0xFFf8a780),
      300: const Color(0xFFf5844d),
      400: const Color(0xFFf2611a),
      500: const Color(0xFFf04f01),
      600: const Color(0xFFd84701),
      700: const Color(0xFFc03f01),
      800: const Color(0xFFa83701),
      900: const Color(0xFF902f01)
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shoes Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: accentColorSwatch,
      ),
      home: SplashScreen(),
    );
  }
}
