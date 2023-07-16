import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/Theme/Themes.dart';
import 'package:quiz/View/pages/Start/SatrtScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.darkTheme,
      home: SatrtScreen(),
    );
  }
}
