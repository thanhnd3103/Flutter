import 'package:cat_02_quizzet/welcome_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade200,
                Colors.blue.shade400,
                Colors.blue.shade600,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const WelcomeContainer(),
        ),
      ),
    ),
  );
}
