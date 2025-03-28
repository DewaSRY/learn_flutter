import 'package:flutter/material.dart';
import 'package:max_learn/expenses_app/domain/entities/category_model.dart';
import 'package:max_learn/expenses_app/domain/entities/expenses_model.dart';
import 'package:max_learn/expenses_app/utils/third_library.dart';

class ExpensesItemWidget extends StatelessWidget {
  final ExpensesModel expenses;
  final Color surfaceTintColor;

  const ExpensesItemWidget({
    required this.expenses,
    required this.surfaceTintColor,
    super.key});

  String get _amount {
    return numberFormat.format(expenses.amount);
  }

  String get _date {
    return dateFormat.format(expenses.date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      surfaceTintColor: surfaceTintColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(flex: 3, child: Text(expenses.title, style: TextStyle(fontSize: 16),)),
                Expanded(child: Icon(categoryIconsMap[expenses.category])),
                Expanded(flex: 2, child: Text("\$$_amount", textAlign: TextAlign.right,), ),
              ],
            ),
            Text(
              _date,
              style: TextStyle(fontSize: 11, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
