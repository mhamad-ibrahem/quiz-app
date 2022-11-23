import 'package:get/get.dart';
import '../../Services/Services.dart';
import '../../Theme/Themes.dart';

class ThemeController extends GetxController {
  Services services = Get.find();
  bool? switchTheme; //switch value
  bool? saveTheme; //to save theme status

  changeTheme(bool val2) {
    switchTheme = val2;
  //change to light mode
    if (switchTheme == false) {
      Get.changeTheme(Themes.lightTheme);
    }
  //change to dark mode
    if (switchTheme == true) {
      Get.changeTheme(Themes.darkTheme);
    }
    //storage the switch value
    services.sharedPreferences.setBool('dark', switchTheme!);
   update();
  }

  @override
  void onInit() {
    //intial theme 
    saveTheme = services.sharedPreferences.getBool('dark') ?? false;
    switchTheme = saveTheme!;
    super.onInit();
  }
}
