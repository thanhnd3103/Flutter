import 'package:cat_05_mew_meal/_data/template_data.dart';
import 'package:cat_05_mew_meal/widgets/categories_screen/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Menu Mew Mew"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (ctx, index) {
          return CategoryGridItem(category: availableCategories[index]);
        },
      ),
    );  
  }
}