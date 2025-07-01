import 'package:cat_03_expense_tracker/screens/home.dart';
import 'package:flutter/material.dart';

//prefix k is for global variable
var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.pink,
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer
        ),
      ),
      home: const Home(),
    ),
  );
}
