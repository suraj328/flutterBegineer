import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
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
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
