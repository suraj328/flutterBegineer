import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/Questions.dart';
import 'package:quizz_app/models/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late int currentQuestionIndex;
  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //accessing list store object in modal class name questions of dart folder
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          //vertical approach alignment inside column
          mainAxisAlignment: MainAxisAlignment.center,
          //horizontal approach alignment inside column
          // fill all availabe space in the screen by stretch property
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 215, 253, 209),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            //static approach of accessing list of modal class
            // AnswerButton(answerText: question.answers[0], onTap: () {}),
            // AnswerButton(answerText: question.answers[1], onTap: () {}),
            // AnswerButton(answerText: question.answers[2], onTap: () {}),
            // AnswerButton(answerText: question.answers[3], onTap: () {}),
            // ---------------------------------
            // dynamic approach of mapping list for dynamic creation
            // ...currentQuestion.answers.map(
            //   (answer) => AnswerButton(answerText: answer, onTap: () {}),
            // )
            // -------------------------------------------------
            // dynamic approach of mapping list for dynamic creation using shuffle() flutter method
            // getShuffleAnswer() method is declared in modal class of question.dart
            // shuffle() method provides unorder element  available in list
            // while in above case its provide order list element
            //hence shuffle method cannot use directly , we need to create it to modal class
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      }),
                )
          ],
        ),
      ),
    );
  }
}
