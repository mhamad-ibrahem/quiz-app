import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Controller/ThemeController.dart';
import 'package:quiz/Services/Services.dart';
import 'package:quiz/Theme/Themes.dart';
import 'package:quiz/View/Start/SatrtScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await   initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeController localController = Get.put(ThemeController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: localController.saveTheme == false ||
              localController.saveTheme == null
          ? Themes.lightTheme
          : Themes.darkTheme,
      home: SatrtScreen(),
    );
  }
}
