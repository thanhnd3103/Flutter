import 'package:cat_03_expense_tracker/_models/expense.dart';
import 'package:cat_03_expense_tracker/widgets/home/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //======================================
    //If this constructor is called, all item will be rendered at once (NOT IDEAL)
    //======================================
    // return ListView(
    //   children: [],
    // );

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}
