import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constant/constant.dart';
import '../../Controller/Controller.dart';

class QusstionBody extends StatelessWidget {
  QusstionBody({
    Key? key,
    required this.choosenAnswer,
    required this.questionNumber,
  }) : super(key: key);
  QuizImplement controller = Get.put(QuizImplement(), permanent: true);
  final int choosenAnswer;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: GestureDetector(
        onTap: () {
          controller.checkanswer(choosenAnswer);
          controller.nextQuistionbyanswer();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: white),
            color: grey,
          ),
          child: Text(
            '${choosenAnswer + 1}. ${controller.questions[questionNumber].options[choosenAnswer]}',
            style: TextStyle(color: black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
