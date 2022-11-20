import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz/Theme/Themes.dart';
import 'package:quiz/View/Main/MainScreen.dart';
import 'package:quiz/View/Start/SatrtScreen.dart';
import 'View/Main/QuizBody.dart';

void main()async{
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
       theme:Themes.lightTheme ,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      home: SatrtScreen(),
    );
  }
}
