import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/View/pages/Main/custom/CircleTimer.dart';

import '../../../Controller/quiz_controller.dart';
import '../../Widget/CustomButton.dart';
import 'custom/question_container.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final QuizImplement controller = Get.put(QuizImplement(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GetBuilder<QuizImplement>(
                        builder: (controller) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Question',
                                  style: Get.textTheme.headline2,
                                  children: <TextSpan>[
                                    // question number
                                    TextSpan(
                                      text: ' ${controller.questionNumber}',
                                      style: Get.textTheme.headline2,
                                    ),
                                    //all question count
                                    TextSpan(
                                        text: '/${controller.questions.length}',
                                        style: Get.textTheme.headline3),
                                  ],
                                ),
                              ),
                              CircleTimer(
                                  startCounter: controller.timerCounter,
                                  endCounter: controller.circleTimer)
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      QuestionContainer(),
                      const SizedBox(
                        height: 50,
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
                    controller.nextQuistionbyskip();
                  },
                  buttonText: 'Skip >',
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
