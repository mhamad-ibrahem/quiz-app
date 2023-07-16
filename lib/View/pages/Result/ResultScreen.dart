import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Controller/quiz_controller.dart';
import 'package:quiz/View/Widget/CustomButton.dart';
import '../../../core/Constant/constant.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final QuizImplement controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.size.width * 0.2),
                child: ConfettiWidget(
                  confettiController: controller.confettiController,
                  shouldLoop: true,
                  blastDirection: pi / 3,
                  blastDirectionality: BlastDirectionality.explosive,
                  colors: const [AppColors.amber, AppColors.red],
                  gravity: 0.3,
                  numberOfParticles: 30,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.finalResult > 60
                          ? Text('Congratulation',
                              style: Get.textTheme.headline2)
                          : const Text('You Can Do Better',
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(controller.name.toUpperCase(),
                          style: const TextStyle(
                              color: AppColors.amber,
                              fontSize: 25,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Your Score is :', style: Get.textTheme.headline2),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('${controller.finalResult}/100',
                          style: const TextStyle(
                              color: AppColors.amber, fontSize: 30)),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Lottie.asset('images/finish.json'))),
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
                    controller.restart();
                  },
                  buttonText: 'Start Again',
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
