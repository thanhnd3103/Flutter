import 'package:flutter/material.dart';

String mySuperAwesomeText = "Hello world";

class StyledText extends StatelessWidget {
  StyledText({super.key, required String yourAwesomeText}){
    mySuperAwesomeText = yourAwesomeText;
  }

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
