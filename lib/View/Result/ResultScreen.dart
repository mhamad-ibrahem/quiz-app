import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Controller/Controller.dart';
import 'package:quiz/Widget/CustomButton.dart';
import '../../Constant/constant.dart';
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
          padding: const EdgeInsets.only(left: 15, right: 15,top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.finalresult > 60
                    ? Text('Congratulation',
                        style: TextStyle(color: amber, fontSize: 30))
                    : Text('You Can Do Better',
                        style: TextStyle(color: red, fontSize: 30)),
                const SizedBox(
                  height: 10,
                ),
                Text(controller.name.toUpperCase(),
                    style: TextStyle(color: amber, fontSize: 30)),
                const SizedBox(
                  height: 10,
                ),
                Text('Your Score is', style: Get.textTheme.headline2),
                const SizedBox(
                  height: 20,
                ),
                Text('${controller.finalresult}/100',
                    style: TextStyle(color: amber, fontSize: 30)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Lottie.asset('images/finish.json'))),
                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: CustomButton(
                      onPress: () {
                        controller.restart();
                      },
                      buttonText: 'Start Again',
                      leftPadding: 100,
                      rightPadding: 100),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
