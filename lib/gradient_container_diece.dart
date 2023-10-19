import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller_statefull.dart';
// import 'package:flutter_application_1/styled_text.dart';

const alignmentStart = Alignment.topLeft;
const alignmentEnd = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color colorMid;
  GradientContainer(this.color1, this.colorMid, this.color2, {super.key});
  // for dice
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, colorMid, color2],
            begin: alignmentStart,
            end: alignmentEnd),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
