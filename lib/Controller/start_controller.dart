import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/pages/Main/MainScreen.dart';

class StartController extends GetxController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  goToMainPage() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      String name = nameController.text;
      Get.off(() => MainScreen(),
          duration: const Duration(seconds: 1),
          transition: Transition.fade,
          arguments: {'name': name});
    }
    nameController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
