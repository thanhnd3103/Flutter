import 'dart:convert';

import 'package:cat_06_shopping_list/_data/template_data.dart';
import 'package:cat_06_shopping_list/_models/grocery_item.dart';
import 'package:cat_06_shopping_list/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class GroceryList extends ConsumerStatefulWidget {
  const GroceryList({super.key});

  @override
  ConsumerState<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends ConsumerState<GroceryList> {
  List<GroceryItem> _groceryItems = dummyGroceryItems;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-tutorial-464d2-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list.json',
    );

    final response = await http.get(url);

    final Map<String, dynamic> jsonData = json.decode(
      response.body,
    );

    final List<GroceryItem> loadedItems = [];

    for (final item in jsonData.entries) {
      final category = dummyCategories.entries.firstWhere(
        (element) => element.value.name == item.value['category'],
      ).value;

      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }

    setState(() {
      _groceryItems = loadedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groceries List"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (direction) => {
              setState(() {
                _groceryItems.remove(_groceryItems[index]);
              }),
            },
            key: ValueKey(_groceryItems[index].id),
            child: ListTile(
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              title: Text(_groceryItems[index].name),
              trailing: Text(
                _groceryItems[index].quantity.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
