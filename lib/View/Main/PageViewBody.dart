import 'package:flutter/material.dart';
import 'package:quiz/View/Main/QuizBody.dart';

import '../../Constant/constant.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody(
      {super.key, required this.question, required this.questionNumber1, required this.questionNumber2, required this.questionNumber3, required this.questionNumber4});
  final String question;
  final int questionNumber1;
  final int questionNumber2;
  final int questionNumber3;
  final int questionNumber4;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(color: white, fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          //Quwstions
          QusstionBody(
            choosenAnswer: 0,
            questionNumber: questionNumber1,
          ),
          QusstionBody(
              choosenAnswer: 1, questionNumber:questionNumber2 ),
          QusstionBody(
              choosenAnswer: 2, questionNumber:questionNumber3 ),
          QusstionBody(
              choosenAnswer: 3, questionNumber:questionNumber4 ),
        ],
      ),
    );
  }
}
