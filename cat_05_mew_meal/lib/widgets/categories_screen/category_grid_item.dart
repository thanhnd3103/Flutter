import 'package:cat_05_mew_meal/_models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget{

  const CategoryGridItem({super.key, required Category category}) : _category = category;

  final Category _category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _category.color.withValues(alpha: 0.55),
            _category.color.withValues(alpha: 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        _category.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}