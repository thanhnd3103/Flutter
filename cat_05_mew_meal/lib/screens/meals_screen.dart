import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/screens/meal_detail_screen.dart';
import 'package:cat_05_mew_meal/widgets/meals_screen/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealList});

  final String title;
  final List<Meal> mealList;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: mealList[index],
        onSelectMeal: (meal) {
          _selectMeal(context, meal);
        }
      ),
    );

    if (mealList.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Jumpscare Mew Mew",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Get out!!!!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
