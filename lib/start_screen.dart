import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.quizApp, {super.key});
  final void Function() quizApp;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //first way to change opacity of image max size is 1.0
          // or traditional way to set imagae transparency
          //opacity key contains value where child need image need to transpaerency
          // Opacity(
          //   opacity: 0.4,
          //   child: Image.asset(
          //     "assets/image/quiz-logo.png",
          //     width: 200,
          //   ),
          // ),
          //second way to change opacity of image by color used rgb
          Image.asset(
            "assets/image/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Amazing Quiz App With Flutter",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 215, 253, 209),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // OutlinedButton only allow you to give outlined border button with text
          // Here OutlinedButton icon allow you to add icon to button by label properties used to set text to button
          OutlinedButton.icon(
            onPressed: quizApp,
            label: const Text("Start Quiz"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
