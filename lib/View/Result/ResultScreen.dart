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
                controller.finalResult > 60
                    ? Text('Congratulation',
                        style:  Get.textTheme.headline2)
                    : Text('You Can Do Better',
                        style: TextStyle(color: red, fontSize: 25,fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Text(controller.name.toUpperCase(),
                    style: TextStyle(color: amber, fontSize: 25,fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                Text('Your Score is :', style: Get.textTheme.headline2),
                const SizedBox(
                  height: 20,
                ),
                Text('${controller.finalResult}/100',
                    style: TextStyle(color: amber, fontSize: 30)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Lottie.asset('images/finish.json'))),
                 SizedBox(
                  height: MediaQuery.of(context).size.height*0.075,
                ),
                Center(
                  child: CustomButton(
                      onPress: () {
                        controller.restart();
                      },
                      buttonText: 'Start Again',
                      leftPadding: 90,
                      rightPadding: 90),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
