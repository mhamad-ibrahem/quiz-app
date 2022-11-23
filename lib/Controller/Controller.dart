import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/View/Main/MainScreen.dart';
import 'package:quiz/View/Start/SatrtScreen.dart';
import '../Model/Question.Model.dart';
import '../View/Result/ResultScreen.dart';

abstract class QuestionController extends GetxController {
  void nextQuistionbyskip(); //reset timer after skip  the question and move to next question

  void nextQuistionbyanswer(); //move to the next question after choose the answer

  void timerstart(); //start a timer and reset it when its become zero

  void resettimer(); //restart timer

  void checkanswer(int answer); //check if answer is right or no

  void restart(); //restart all

  void goToMainScreen();

  startrealtimer();
}

class QuizImplement extends QuestionController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  late PageController pageController; //page controller
  String name = '';
  // list of question
  List<Questions> questions = [
    Questions(
        id: 0,
        answer: 0,
        question: 'A scrollable widget',
        options: ['ListView', 'Expanded', 'MaterialButton', 'Container']),
    Questions(id: 1, answer: 0, question: 'Flutter is a ?', options: [
      'framework',
      'programming language',
      'Application',
      'All of the above is true'
    ]),
    Questions(
        id: 2,
        answer: 1,
        question: 'Firebase is Presented by ?',
        options: ['Meta', 'Google', 'Amd', 'Microsoft']),
    Questions(
        id: 3,
        answer: 1,
        question: 'Fastest local storage',
        options: ['ShredPrefrence', 'Hive', 'SqFlite', 'GetStorage']),
    Questions(
        id: 4,
        answer: 2,
        question: 'An EcoSystem State Mangement',
        options: ['Provider', 'Bloc', 'Getx', 'None a bove is true']),
    Questions(
        id: 5,
        answer: 0,
        question: 'The best language to start learning is?',
        options: ['C++', 'Java', 'Dart', 'Pyson']),
    Questions(
        id: 6,
        answer: 3,
        question: 'Button with out splash effect',
        options: [
          'MaterialButton',
          'IconButton',
          'TextButton',
          'GestureDetector'
        ]),
    Questions(id: 7, answer: 2, question: 'Firebase is', options: [
      'Free service',
      'Not free',
      'Limited',
      'None a bove is true'
    ]),
    Questions(
        id: 8,
        answer: 2,
        question: 'Widget dont take more than one child',
        options: ['Column', 'Row', 'Container', 'Stack']),
    Questions(
        id: 9,
        answer: 0,
        question: 'Widget use for input',
        options: ['TextFormField', 'Divider', 'SizedBox', 'ListTile']),
  ];
  int questionNumber = 1; // number of the question
  int currentQuestion = 0; // the question that we see in the screen
  int timerCounter = 10; // time after question change
  double circleTimer = 0; //the circle fill value
  bool isPressed = false; // if we answer the question
  int finalResult = 0; //the final result of your answer
  int correctAnswers = 0; // the number of our correct answer
  late Timer timer; //timer

  @override
  goToMainScreen() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      name = nameController.text;
      Get.off(
        () => MainScreen(),
        duration: const Duration(seconds: 3),
        transition: Transition.size,
        arguments: startrealtimer(),
      );
    }
  }

  @override
  void nextQuistionbyskip() {
    //skip to next question and reset timer
    resettimer();
  }

  @override
  void nextQuistionbyanswer() {
    //after choose answer move to next question
    isPressed = true;
    nextQuistionbyskip();
  }

  @override
  void timerstart() {
    //start timer
    pageController = PageController(
      //the first page of questions
      initialPage: currentQuestion,
    );
    //set timer
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

  @override
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
      nameController.clear();
    }
  }

  @override
  void checkanswer(int answer) {
    isPressed = true;
    //check if our answer equal the true answer
    if (answer == questions[currentQuestion].answer) {
      correctAnswers++; //incraese the correct answer
      finalResult = finalResult + 10; //final resualt of 100
    }
  }

  @override
  void restart() {
    currentQuestion = 0; //to restart current question to 0
    questionNumber = 1; //to return to the first question
    correctAnswers = 0; //to reset the correct answer
    finalResult = 0; // to reset the final result
    Get.offAll(() => SatrtScreen(), //return to the first screen
        duration: const Duration(seconds: 2),
        transition: Transition.fade);
    timer.cancel(); //stop timer
  }

  @override
  startrealtimer() {
    timerstart();
  }
}
