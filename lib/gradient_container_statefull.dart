import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/styled_text.dart';

const alignmentStart = Alignment.topLeft;
const alignmentEnd = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color colorMid;
  const GradientContainer(
      {required this.color1,
      required this.colorMid,
      required this.color2,
      super.key});
  @override
  // ignore: library_private_types_in_public_api
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  var activeDieceImage = './assets/images/dice_1.png';
  void rollDice() {
    Random random = Random();
    int dieceNum = random.nextInt(6);
    print("diece number is:- $dieceNum");
    setState(() {
      switch (dieceNum) {
        case 0:
          activeDieceImage = './assets/images/dice_1.png';
          break;
        case 1:
          activeDieceImage = './assets/images/dice_2.png';
          break;
        case 2:
          activeDieceImage = './assets/images/dice_3.png';
          break;
        case 3:
          activeDieceImage = './assets/images/dice_4.png';
          break;
        case 4:
          activeDieceImage = './assets/images/dice_5.png';
          break;
        case 5:
          activeDieceImage = './assets/images/dice_6.png';
          break;
        default:
          break;
      }
    });
  }

  @override
  // Widget build(context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //           colors: [widget.color1, widget.colorMid, widget.color2],
  //           begin: alignmentStart,
  //           end: alignmentEnd),
  //     ),
  //     child: Center(
  //       // child: StyledText("Hello World!"),
  //     ),
  //   );
  // }
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [widget.color1, widget.colorMid, widget.color2],
            begin: alignmentStart,
            end: alignmentEnd),
      ),
      child: Center(
        // Image.assets() method used to display images
        // before using this method,its compulsory to modify assets comment line with your local image path

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDieceImage,
              // './assets/images/dice_1.png',
              width: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    // if SizeClass box is mentioned we do not need to mention padding
                    // padding: const EdgeInsets.only(top: 20),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28),
                    backgroundColor: Colors.pinkAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                onPressed: rollDice,
                child: const Text("Roll")),
          ],
        ),
      ),
    );
  }
}
