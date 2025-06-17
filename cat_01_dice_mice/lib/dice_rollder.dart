import 'package:cat_01_dice_mice/styled_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

//=================================
//in StatefulWidget, you always work with two classes:
// 1. The StatefulWidget class itself, which is immutable and can be used to create the widget.
// 2. The State class, which is mutable and contains the state of the widget.
//=================================
class DiceRoller extends StatefulWidget {
  //============================
  //add const to this class
  //============================
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceNumber = 2;

  void rollDice() {
    setState(randomDiceNumber);
  }

  void randomDiceNumber(){
      currentDiceNumber = randomizer.nextInt(6) + 1;
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceNumber.png',
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 16,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text("Roll the Mice Dice"),
        ),
      ],
    );
  }
}
