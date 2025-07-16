import 'package:cat_05_mew_meal/_models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{

  //====================================
  //Not allow to edit initial value, must always create a new one
  //====================================
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal){
    final isFavorite = state.contains(meal);

    if (isFavorite){
      state = state.where((m) => m.id != meal.id).toList();
    }
    else{
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvder = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});