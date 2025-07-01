import 'package:cat_03_expense_tracker/_models/expense.dart';
import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';
import 'package:cat_03_expense_tracker/widgets/home/expense_list.dart';
import 'package:cat_03_expense_tracker/widgets/modals/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  void _openAddExpenseModel() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    //clear any snack bar that still exist
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("mew"),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            expenses.insert(expenseIndex, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModel,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          expenses.isEmpty
              ? const Center(
                  child: Text('No expense found. Start adding some!'),
                )
              : Expanded(
                  child: ExpenseList(
                    expenses: expenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
        ],
      ),
    );
  }
}
