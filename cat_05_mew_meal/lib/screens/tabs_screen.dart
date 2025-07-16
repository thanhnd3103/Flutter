import 'package:cat_05_mew_meal/_utils/enums.dart';
import 'package:cat_05_mew_meal/providers/favorites_provider.dart';
import 'package:cat_05_mew_meal/providers/filter_provider.dart';
import 'package:cat_05_mew_meal/providers/meals_provider.dart';
import 'package:cat_05_mew_meal/screens/categories_screen.dart';
import 'package:cat_05_mew_meal/screens/filter_screen.dart';
import 'package:cat_05_mew_meal/screens/meals_screen.dart';
import 'package:cat_05_mew_meal/widgets/tabs_screen/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilter = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final activeFilters = ref.watch(filtersProvider);

    final availableMeals = meals.where((item) {
      if (activeFilters[Filter.glutenFree]! && !item.isGlutenFree){
        return false;
      }

      if (activeFilters[Filter.lactoseFree]! && !item.isLactoseFree){
        return false;
      }

      if (activeFilters[Filter.vegetarian]! && !item.isVegetarian){
        return false;
      }

      if (activeFilters[Filter.vegan]! && !item.isVegan){
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvder);
      activePage = MealsScreen(
        mealList: favoriteMeals,
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
