import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/quiz_controller.dart';
import '../../../../core/Constant/constant.dart';
import 'PageViewBody.dart';

class QuestionContainer extends StatelessWidget {
  QuestionContainer({super.key});
  final QuizImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 460,
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(15)),
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
                  controller.currentQuestion = index;
                  return PageViewBody(
                    question: controller.questions[index].question,
                    questionNumber1: controller.currentQuestion,
                    questionNumber2: controller.currentQuestion,
                    questionNumber3: controller.currentQuestion,
                    questionNumber4: controller.currentQuestion,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
