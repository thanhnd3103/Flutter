import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Category {
  final String id;
  final String title;
  final Color color;

  Category({required this.title, this.color = Colors.orange}) : id = uuid.v8();
}