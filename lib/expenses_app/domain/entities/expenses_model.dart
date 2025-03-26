import 'package:flutter/material.dart';
import 'package:max_learn/expenses_app/domain/entities/category_model.dart';
import 'package:max_learn/expenses_app/utils/third_library.dart';

class ExpensesModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryEnum category;

  ExpensesModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id =getUuid();
}
