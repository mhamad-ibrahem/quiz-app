import 'package:flutter/material.dart';
import 'package:quiz/Controller/start_controller.dart';
import 'package:quiz/View/Widget/CustomButton.dart';
import 'package:quiz/View/Widget/CustomForm.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SatrtScreen extends StatelessWidget {
  SatrtScreen({super.key});
  final StartController controller = Get.put(StartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
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
                        'Lets start quiz\nEnter your name here',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: controller.formstate,
                        child: CustomForm(
                          labelText: 'Name',
                          controller: controller.nameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Cant be empty';
                            } else if (val.length > 30) {
                              return 'Cant be more than 30 letter';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  onPress: () {
                    controller.goToMainPage();
                  },
                  buttonText: 'Start',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
