import 'package:flutter/material.dart';
import 'package:quiz/Constant/constant.dart';


class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 20, color: lblack, fontWeight: FontWeight.w500),
      headline2:
          TextStyle(fontSize: 30, color: black, fontWeight: FontWeight.w600),
      headline3:
          TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w500),
      headline4:
          TextStyle(fontSize: 25, color: black, fontWeight: FontWeight.w600),
    ),
    primaryColor: black,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: black,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 20, color: lwight, fontWeight: FontWeight.w500),
      headline2:
          TextStyle(fontSize: 30, color: white, fontWeight: FontWeight.w600),
      headline3:
          TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      headline4:
          TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.w600),
    ),
    backgroundColor: black,
    primaryColor: white,
  );
}
