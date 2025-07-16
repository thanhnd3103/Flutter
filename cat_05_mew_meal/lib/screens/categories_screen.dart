import 'package:cat_05_mew_meal/_data/template_data.dart';
import 'package:cat_05_mew_meal/_models/category.dart';
import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/screens/meals_screen.dart';
import 'package:cat_05_mew_meal/widgets/categories_screen/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: "MewMew",
          mealList: availableMeals
              .where(
                (element) => element.categories.contains(category.id),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (ctx, index) {
        return CategoryGridItem(
          category: availableCategories[index],
          onSelectCategory: () {
            _selectCategory(context, availableCategories[index]);
          },
        );
      },
    );
  }
}
