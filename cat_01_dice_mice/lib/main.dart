import 'package:cat_01_dice_mice/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [
            Color.fromARGB(255, 19, 76, 183),
            Color.fromARGB(255, 130, 64, 109),
            Color.fromARGB(255, 50, 202, 60),
            Color.fromARGB(255, 12, 194, 182),
          ],
        ),
      ),
    ),
  );
}