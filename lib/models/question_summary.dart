import 'package:flutter/cupertino.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    //sizebox provide fix numbers of height an with to widet for managing space
    // here, sizebox widget have declare for scrolling widget
    return SizedBox(
      height: 300,
      // SingleChildScrollView widget provide for scrollable layout
      child: SingleChildScrollView(
        child: Column(
            //itterating summary data
            children: summaryData.map((data) {
          return Row(
            children: [
              Text(
                // as keyword used for declaring data types
                ((data['question_index'] as int) + 1).toString(),
              ),
              // expanded take all availabe space of the screen prevent from overflow
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              )
            ],
          );
          //since value for column of children property is list so we changing map value to list
          // it also change to list because we need acess value of map
        }).toList()),
      ),
    );
  }
}
