import 'package:cat_01_dice_mice/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 156, 156, 1),
          Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ),
  );
}