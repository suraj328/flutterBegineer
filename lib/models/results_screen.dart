import 'package:flutter/material.dart';
import 'package:quizz_app/data/Questions.dart';
import 'package:quizz_app/models/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer});

  final List<String> choosenAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly"),
            const SizedBox(
              height: 30,
            ),
            // const Text("List of  answers and questions..."),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
