import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/View/Main/MainScreen.dart';
import 'package:quiz/View/Start/SatrtScreen.dart';

import '../Model/Question.Model.dart';
import '../View/Result/ResultScreen.dart';

abstract class QuestionController extends GetxController {
  

  void nextQuistionbyskip();  //reset timer after all skip of the question

  void nextQuistionbyanswer(); //move to the next question after choose the answer

  void timerstart(); //start a timer
  void resettimer(); //restart timer

  void checkanswer(int answer); //check if answer is right or no 

  void restart(); //restart all

  startrealtimer();
   goToMainScreen();
}

class QuizImplement extends QuestionController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
   TextEditingController nameController=TextEditingController();
  String name = '';
  // list of question
  List<Questions> questions = [
    Questions(
        id: 0, answer: 0, question: 'A scrollable widget', options: ['ListView', 'Expanded', 'MaterialButton', 'Container']),
    Questions(
        id: 1,
        answer: 0,
        question: 'Flutter is a ?',
        options: ['framework', 'programming language','Application', 'All of the above is true']),
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
        options: ['MaterialButton', 'IconButton', 'TextButton', 'GestureDetector']),
    Questions(
        id: 7,
        answer: 2,
        question: 'Firebase is',
        options: ['Free service', 'Not free', 'Limited','None a bove is true']),
    Questions(
        id: 8,
        answer: 2,
        question: 'Widget dont take more than one child',
        options: ['Column', 'Row', 'Container', 'Stack']),
    Questions(
        id: 9,
        answer: 0,
        question: 'Widget use for input',
        options: ['TextFormField','Divider', 'SizedBox', 'ListTile']),
  ];
  int questionnumber = 1; // number of the question
  int currentquestion = 0; // the current question
  int timercounter = 10; // time after question change
  double circletimer = 0; //the circle fill value
  bool ispressed = false;
  int finalresult = 0; //the final result of your answer
  int correctanswers = 0;
  late Timer _timer; //timer
  late Timer _timer2;
  late PageController pageController; //page controller

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
    //skip to next question
    resettimer();
  }

  @override
  void nextQuistionbyanswer() {
    //after choose answer move to next question
    ispressed = true;
    nextQuistionbyskip();
  }

  @override
  void timerstart() {
    //start timer
    pageController = PageController(
      //the page that we show in the screen
      initialPage: currentquestion,
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timercounter != 0) { //if timer not 0 decrease it 
        timercounter--;
        circletimer = circletimer + 0.1;    //to fill the circle indecator
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
    _timer.cancel(); //canciling timer
    if (questionnumber < 10) {
      //
      questionnumber++; //increase question number
      timercounter = 10; //the number of second until chane question
      circletimer = 0.0; //tye amount of circle
      currentquestion++; //increase current question to move to the next question
      pageController.animateToPage(currentquestion,
          duration: const Duration(seconds: 1), curve: Curves.linear);
      timerstart(); //restart timer after all answer operation
    } else {
      //if the question are end go resualt screen to show result
      Get.off(() =>  ResultScreen(),
          duration: const Duration(seconds:2),
          transition: Transition.fade);
          nameController.clear();
    }
  }

  @override
  void checkanswer(int answer) { 
    ispressed = true;
    if (answer == questions[currentquestion].answer) { //check the answer id its true
      correctanswers++;  //incraese the correct answer
      finalresult = finalresult + 10;    //finalresualt of 100
    }
  }

  @override
  void restart() {
    currentquestion = 0;  //to restart current question to 0
    questionnumber = 1;  //to return to the first question
    correctanswers = 0;  //to reset the correct answer 
    finalresult = 0;     // to reset the final result 
    Get.offAll(() => SatrtScreen(), //return to the first screen  
        duration: const Duration(seconds:2),
        transition: Transition.fade);
    _timer.cancel(); //stop timer
  }

  @override
  startrealtimer() {
    timerstart(); 
    int  correctanswers = questions[currentquestion].answer; 
  }
  
}
