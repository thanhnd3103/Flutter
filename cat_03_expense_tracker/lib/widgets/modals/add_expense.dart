import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _onTitleChanged,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  print(_enteredTitle);
                },
                label: const Text("Save"),
                icon: const Icon(Icons.save_as),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade50,
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
            ],
          ),
        ],
      ),
    );
  }
}
