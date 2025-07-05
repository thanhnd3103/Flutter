import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/main.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget{
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(children: [
        
      ],),
    );
  }
}