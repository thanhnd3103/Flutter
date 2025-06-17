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
  
  GradientContainer(this.colors, {super.key});

  GradientContainer.purple({super.key})
    : colors = const [
        Color.fromARGB(255, 19, 76, 183),
        Color.fromARGB(255, 194, 8, 194),
        Color.fromARGB(255, 253, 9, 9),
        Color.fromARGB(255, 3, 255, 192),
      ];

  final List<Color> colors;

  String activeDiceImage = 'assets/images/dice-2.png';

  void rollDice() {
    activeDiceImage = 'assets/images/dices-4.png';
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
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
        ),
      ),
    );
  }
}
