import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  CategoriesScreen({super.key});

  var testList = [1, 2, 3, 4, 5];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Menu Mew Mew"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemCount: testList.length,
        itemBuilder: (ctx, index) {
          final item = testList[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Item $item",
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );  
  }
}