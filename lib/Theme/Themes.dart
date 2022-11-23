import 'package:flutter/material.dart';
import 'package:quiz/Constant/constant.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: white,
    primaryColor: black,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 18, color: lblack, fontWeight: FontWeight.w500),
      headline2:
          TextStyle(fontSize: 25, color: black, fontWeight: FontWeight.w600),
      headline3:
          TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w500),
      headline4:
          TextStyle(fontSize: 25, color: black, fontWeight: FontWeight.w600),
          headline5:
          TextStyle(fontSize: 15, color: black, fontWeight: FontWeight.w600),
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: black,
    backgroundColor: black,
    primaryColor: white,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 18, color: lwight, fontWeight: FontWeight.w500),
      headline2:
          TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.w600),
      headline3:
          TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      headline4:
          TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.w600),
      headline5:
          TextStyle(fontSize: 15, color: white, fontWeight: FontWeight.w600),
    ),
  );
}
