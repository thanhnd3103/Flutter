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

  const GradientContainer.purple({super.key})
    : colors = const [
        Color.fromARGB(255, 19, 76, 183),
        Color.fromARGB(255, 194, 8, 194),
        Color.fromARGB(255, 253, 9, 9),
        Color.fromARGB(255, 3, 255, 192),
      ];

  final List<Color> colors;

  void rollDice(){
    // This method can be used to implement the dice rolling logic
    // For now, it does nothing.
    print("Dice rolled!");
  }

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
        child: Column(
          children: [
            Image.asset(
              'assets/images/dice-2.png',
              width: 200,
              height: 200,
            ),
            TextButton(
              onPressed: rollDice,
              child: const StyledText("Role the Mice Dice"),
            ),
          ],
        ),
      ),
    );
  }
}
