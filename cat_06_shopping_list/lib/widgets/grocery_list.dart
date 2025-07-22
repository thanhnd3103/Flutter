import 'package:cat_06_shopping_list/_data/template_data.dart';
import 'package:cat_06_shopping_list/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryList extends ConsumerStatefulWidget {
  const GroceryList({super.key});

  @override
  ConsumerState<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends ConsumerState<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
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
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Container(
              width: 24,
              height: 24,
              color: dummyGroceryItems[index].category.color,
            ),
            title: Text(dummyGroceryItems[index].name),
            trailing: Text(
              dummyGroceryItems[index].quantity.toString(),
            ),
          );
        },
      ),
    );
  }
}
