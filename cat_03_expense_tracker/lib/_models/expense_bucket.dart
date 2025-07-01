import 'package:cat_03_expense_tracker/_models/expense.dart';
import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory({
    required List<Expense> allExpenses,
    required this.category,
  }) : expenses = allExpenses
           .where((item) => item.category == category)
           .toList();

  double get totalExpenses{
    double sum = 0;

    for (final item in expenses){
      sum += item.amount;
    }

    return sum;
  }
}