import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {

  //________________________________
  //StyledText(String text, {super.key}) : mySuperAwesomeText = text; 
  //________________________________

  const StyledText(this.mySuperAwesomeText, {super.key});
  
  //first use of final: CAN ONLY BE SET ONCE
  final String mySuperAwesomeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      mySuperAwesomeText,
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 28,
      ),
    );
  }
}
