import 'package:cat_05_mew_meal/_data/template_data.dart';
import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/screens/categories_screen.dart';
import 'package:cat_05_mew_meal/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal){
    if (_favoriteMeals.contains(meal)){
      _favoriteMeals.remove(meal);
    }
    else{
      _favoriteMeals.add(meal);
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage = MealsScreen(mealList: _favoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Facvorites',
          ),
        ],
      ),
    );
  }
}
