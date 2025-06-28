import 'package:cat_03_expense_tracker/_models/expense.dart';
import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Expense> expenses = [
    Expense(
      title: "Groceries",
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Transport",
      amount: 20.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Chart"),
          Text("Expense list"),
        ],
      ),
    );
  }
}
