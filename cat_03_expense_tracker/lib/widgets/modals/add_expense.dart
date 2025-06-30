import 'package:cat_03_expense_tracker/_utils/custom_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('yyyy/MM/dd');

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  //=======================================
  //You must tell flutter to delete the controller
  //when the widget is disposed to avoid memory leaks
  //=======================================
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    //========================================
    // Always call super.dispose() to ensure proper cleanup
    //========================================
    super.dispose();
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);

    final isValidAmount = enteredAmount != null && enteredAmount > 0;

    if (_titleController.text.trim().isEmpty ||
        !isValidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            "Invalid Input",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Please enter valid title, amount and date.",
            style: GoogleFonts.montserrat(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text(
                "Okay",
                style: GoogleFonts.montserrat(),
              ),
            ),
          ],
        ),
      );
      return;
    }
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title", style: GoogleFonts.montserrat()),
              border: const OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount", style: GoogleFonts.montserrat()),
                    prefixText: '\$',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No Date Chosen"
                          : formatter.format(_selectedDate!),
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text("Cancel"),
                icon: const Icon(Icons.cancel),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                  foregroundColor: Colors.green.shade900,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _submitExpenseData,
                label: const Text("Save"),
                icon: const Icon(Icons.save_as),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  foregroundColor: Colors.green.shade50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
