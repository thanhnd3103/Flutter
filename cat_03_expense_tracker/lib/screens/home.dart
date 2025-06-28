import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Chart"),
          Text("Expense list"),
        ],
      ),
    );
  }
}
