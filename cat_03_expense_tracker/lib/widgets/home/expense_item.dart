import 'package:cat_03_expense_tracker/_models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  "\$${expense.amount.toStringAsFixed(2)}",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${expense.date.day}/${expense.date.month}/${expense.date.year}",
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
