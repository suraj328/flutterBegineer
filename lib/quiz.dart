import 'package:flutter/material.dart';
import 'package:quizz_app/data/Questions.dart';
import 'package:quizz_app/models/results_screen.dart';
import 'package:quizz_app/quiz_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          choosenAnswer: selectedAnswer,
        );
        // selectedAnswer.clear();
      });
    }
  }

  Widget? activeScreen;
  // activeScreen = StartScreen(switchScreen);
  // cannot init directly because code run syncronously need to crate object first to assign
  // so it is declare under initState() provided by flutter
  // initState method invoked after class object created sucessfully
  // this process is also known for lifting state

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  // switch screen method contain widget instance need to change widget when button is pressed
  // implement simple logic by switching widget using variable
  //this process also refer as conditional rendering

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Applicaton",
      // Scanffold occupies all the spaces available in screen
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizz App"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.greenAccent,
              Colors.lightGreenAccent,
            ]),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
