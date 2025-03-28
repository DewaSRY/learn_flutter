import 'package:flutter/material.dart';
import 'package:max_learn/expenses_app/presentation/page/expenses_page.dart';

class  ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: ExpensesPage(),
    );
  }
}