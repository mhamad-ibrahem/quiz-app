import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/View/Main/CircleTimer.dart';
import 'package:quiz/View/Main/QuizBody.dart';
import 'package:quiz/Widget/CustomButton.dart';

import '../../Constant/constant.dart';
import '../../Controller/Controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final QuizImplement controller = Get.put(QuizImplement(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                            style:  Get.textTheme.headline2,
                            children: <TextSpan>[
                              // question number
                              TextSpan(
                                text: ' ${controller.questionnumber}',
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
                            startCounter: controller.timercounter,
                            endCounter: controller.circletimer)
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<QuizImplement>(
                  builder: (controller) {
                    return Container(
                      width: double.infinity,
                      height: 460,
                      decoration: BoxDecoration(
                          color: darkGrey, borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: controller.pageController,
                                itemCount: controller.questions.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  controller.currentquestion = index;
                                  return SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.questions[index].question,
                                          style: TextStyle(
                                              color: white, fontSize: 17),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        QusstionBody(
                                          current: 0,
                                          questionnumber:
                                              controller.currentquestion,
                                        ),
                                        QusstionBody(
                                            current: 1,
                                            questionnumber:
                                                controller.currentquestion),
                                        QusstionBody(
                                            current: 2,
                                            questionnumber:
                                                controller.currentquestion),
                                        QusstionBody(
                                            current: 3,
                                            questionnumber:
                                                controller.currentquestion),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomButton(
                        onPress: () {
                          controller.nextQuistionbyskip();
                        },
                        buttonText: 'Skip >',
                        leftPadding: 70,
                        rightPadding: 70),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
