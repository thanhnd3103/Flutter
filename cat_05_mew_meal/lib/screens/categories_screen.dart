import 'package:cat_05_mew_meal/_data/template_data.dart';
import 'package:cat_05_mew_meal/_models/category.dart';
import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/screens/meals_screen.dart';
import 'package:cat_05_mew_meal/widgets/categories_screen/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

//=======================
//explicit animation only works with stateful widget, hence the conversion here
//=======================
//if there are multiple animation controllers, use TickerProviderStateMixin, otherwise SingleTickerProviderStateMixin
//=======================
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  //=======================
  //Tell dart that this will have value as soon as it is used the first time
  //=======================
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      //=======================
      //make animation execute for every frame, remember the SingleTickerProviderStateMixin
      //=======================
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    //=======================
    //start animation until it is done,
    //also have stop() and repeat()
    //=======================
    _animationController.forward();
  }

  @override
  void dispose() {
    //====================
    //have to be disposed manually
    //====================
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: "MewMew",
          mealList: widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      //====================
      //child is the element that won't get rebuild everytime in an animation, so less memory exhausting
      //====================
      child: GridView.builder(
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
      ),
      builder: (ctx, child) => SlideTransition(
        position:
            Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      ),
    );
  }
}
