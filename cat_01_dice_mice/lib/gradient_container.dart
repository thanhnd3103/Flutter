import 'package:cat_01_dice_mice/styled_text.dart';
import 'package:flutter/material.dart';

//final vs const difference
//const is COMPILED TIME CONSTANT (lock in at compile)
//final is... well... a result of some methods, and then lock in (only known when your code is executed)
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  //GradientContainer({key}) : super(key: key);
  const GradientContainer(this.colors, {super.key});

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
      child: const Center(
        child: StyledText("helo"),
      ),
    );
  }
}