import 'package:flutter/material.dart';
import 'package:quiz/Constant/constant.dart';
import 'package:quiz/Controller/ThemeController.dart';
import 'package:quiz/Widget/CustomButton.dart';
import 'package:quiz/Widget/CustomForm.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Controller/Controller.dart';

class SatrtScreen extends StatelessWidget {
  SatrtScreen({super.key});
  final QuizImplement controller = Get.put(QuizImplement());
  final ThemeController themeController =
      Get.put(ThemeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: amber,
          actions: [
            GetBuilder<ThemeController>(
              builder: (controller) => Expanded(
                child: SwitchListTile(
                  value: controller.switchTheme!,
                  onChanged: (val) {
                    controller.changeTheme(val);
                  },
                  activeColor: black,
                  title: Text(
                    'Enable dark mode',
                    style: TextStyle(
                        fontSize: 19,
                        color: white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Lottie.asset('images/questionMark.json'),
                ),
                Text(
                  'Lets start quiz\nenter your name here',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height:MediaQuery.of(context).size.height * 0.055),
                Form(
                  key: controller.formstate,
                  child: CustomForm(
                    labelText: 'Name',
                    controller: controller.nameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'cant be empty';
                      } else if (val.length > 20) {
                        return 'cant be more than 20 letter';
                      }
                    },
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Center(
                  child: CustomButton(
                    onPress: () {
                      controller.goToMainScreen();
                    },
                    buttonText: 'Start',
                    leftPadding: 100,
                    rightPadding: 100,
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
