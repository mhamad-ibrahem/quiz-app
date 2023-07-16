import 'package:flutter/material.dart';
import 'package:quiz/core/Constant/constant.dart';

class Themes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    backgroundColor: AppColors.black,
    primaryColor: AppColors.white,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 18, color: AppColors.lwight, fontWeight: FontWeight.w500),
      headline2: TextStyle(
          fontSize: 25, color: AppColors.white, fontWeight: FontWeight.w600),
      headline3: TextStyle(
          fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w500),
      headline4: TextStyle(
          fontSize: 25, color: AppColors.white, fontWeight: FontWeight.w600),
      headline5: TextStyle(
          fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w600),
    ),
  );
}
