import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/View/pages/Start/SatrtScreen.dart';
import '../data/Model/Question.Model.dart';
import '../View/pages/Result/ResultScreen.dart';
import '../data/static/question_list.dart';
import 'package:confetti/confetti.dart';

class QuizImplement extends GetxController {
  late PageController pageController;
  String name = Get.arguments['name'];
  bool isPlayingConffite = false;
  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 5));
  List<Questions> questions = questionsList;
  int questionNumber = 1;
  int currentQuestion = 0;
  int timerCounter = 10;
  double circleTimer = 0;
  bool isPressed = false;
  int finalResult = 0;
  int correctAnswers = 0;
  late Timer timer;
  @override
  void onInit() {
    timerstart();
    pageController = PageController(
      initialPage: currentQuestion,
    );

    super.onInit();
  }

  void nextQuistionbyskip() {
    //skip to next question and reset timer
    resettimer();
  }

  void nextQuistionbyanswer() {
    //after choose answer move to next question
    isPressed = true;
    nextQuistionbyskip();
  }

  void timerstart() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCounter != 0) {
        //if timer number not 0 decrease it
        timerCounter--;
        circleTimer = circleTimer + 0.1; //to fill the circle indecator
        update();
      } else {
        resettimer();
        update();
      }
    });
  }

  void resettimer() {
    //restart timer
    timer.cancel(); //canciling timer
    if (questionNumber < 10) {
      questionNumber++; //increase question number
      timerCounter = 10; //reset the timer to 10 second
      circleTimer = 0.0; //reset the circle fill to zero
      currentQuestion++; //increase current question to move to the next question
      pageController.animateToPage(currentQuestion,
          duration: const Duration(seconds: 1), curve: Curves.linear);
      timerstart(); //restart timer after all answer operation
    } else {
      //if the question are end go resualt screen to show result
      Get.off(() => ResultScreen(),
          duration: const Duration(seconds: 2), transition: Transition.fade);
      Future.delayed(const Duration(seconds: 2), () {
        confettiController.play();
      });
    }
  }

  void checkanswer(int answer) {
    isPressed = true;
    //check if our answer equal the true answer
    if (answer == questions[currentQuestion].answer) {
      correctAnswers++; //incraese the correct answer
      finalResult = finalResult + 10; //final resualt of 100
    }
  }

  void restart() {
    currentQuestion = 0; //to restart current question to 0
    questionNumber = 1; //to return to the first question
    correctAnswers = 0; //to reset the correct answer
    finalResult = 0; // to reset the final result
    Get.offAll(() => SatrtScreen(), //return to the first screen
        duration: const Duration(seconds: 2),
        transition: Transition.fade);
    timer.cancel(); //stop timer
    confettiController.stop();
  }
}
