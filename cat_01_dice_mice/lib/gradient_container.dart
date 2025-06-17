import 'package:cat_01_dice_mice/dice_rollder.dart';
import 'package:cat_01_dice_mice/styled_text.dart';
import 'package:flutter/material.dart';

//=================================
//const is COMPILED TIME CONSTANT (lock in at compile)
//final is... well... a result of some methods, and then lock in (only known when your code is executed)
//=================================

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

//=================================
//use StatelessWidget when the UI is static, receive input once, and does not change after that
//use StatefulWidget when you need to change the state of the widget either internally or externally at all times
//=================================

class GradientContainer extends StatelessWidget {
  //_______________________________
  //GradientContainer({key}) : super(key: key);
  //_______________________________

  const GradientContainer(this.colors, {super.key});

  const GradientContainer.purple({super.key})
    : colors = const [
        Color.fromARGB(255, 19, 76, 183),
        Color.fromARGB(255, 194, 8, 194),
        Color.fromARGB(255, 253, 9, 9),
        Color.fromARGB(255, 3, 255, 192),
      ];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
