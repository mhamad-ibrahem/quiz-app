import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Theme/Themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true; 
void toggleDarkMode() {
  isDarkMode = !isDarkMode;
  if (isDarkMode) {
   Get.changeTheme(Themes.darkTheme);
  } else {
   Get.changeTheme(Themes.lightTheme);
  }
 update();
}
@override
  void onInit() {
    toggleDarkMode();
    super.onInit();
  }

}
