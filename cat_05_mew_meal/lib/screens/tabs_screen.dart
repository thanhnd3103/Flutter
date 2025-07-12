import 'package:cat_05_mew_meal/_data/template_data.dart';
import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:cat_05_mew_meal/_utils/enums.dart';
import 'package:cat_05_mew_meal/screens/categories_screen.dart';
import 'package:cat_05_mew_meal/screens/filter_screen.dart';
import 'package:cat_05_mew_meal/screens/meals_screen.dart';
import 'package:cat_05_mew_meal/widgets/tabs_screen/main_drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilter = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  Map<Filter, bool> _selectedFilter = kInitialFilter;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Cats don't like this mew.");
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage("Cats do like this mew.");
      }
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            currentFilters: _selectedFilter,
          ),
        ),
      );

      setState(() {
        _selectedFilter = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((item) {
      if (_selectedFilter[Filter.glutenFree]! && !item.isGlutenFree){
        return false;
      }

      if (_selectedFilter[Filter.lactoseFree]! && !item.isLactoseFree){
        return false;
      }

      if (_selectedFilter[Filter.vegetarian]! && !item.isVegetarian){
        return false;
      }

      if (_selectedFilter[Filter.vegan]! && !item.isVegan){
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        mealList: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
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
