import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v8();
}