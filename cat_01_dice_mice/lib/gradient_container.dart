import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  //GradientContainer({key}) : super(key: key);
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.blue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          "con mèo nằm trên nệm siêu béo đố m hot reload được đó :v",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}