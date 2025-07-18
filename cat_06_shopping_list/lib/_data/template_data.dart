import 'package:cat_06_shopping_list/_models/category.dart';
import 'package:cat_06_shopping_list/_models/grocery_item.dart';
import 'package:cat_06_shopping_list/_utils/enum.dart';
import 'package:flutter/widgets.dart';

const dummyCategories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};

final dummyGroceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: dummyCategories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: dummyCategories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: dummyCategories[Categories.meat]!),
];