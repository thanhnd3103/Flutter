import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat('yyyy/MM/dd');

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

  String get formattedDate {
    return formatter.format(date);
  }
}