import 'package:max_learn/expenses_app/domain/entities/category_model.dart';
import 'package:max_learn/expenses_app/domain/entities/expenses_model.dart';

final List<ExpensesModel> expensesDummyList = [
  ExpensesModel(
    title: "Food one",
    amount: 100.0,
    date: DateTime.now(),
    category: CategoryEnum.food,
  ),
  ExpensesModel(
    title: "Mac Book",
    amount: 1_000_000.00,
    date: DateTime.now(),
    category: CategoryEnum.work,
  ),
  ExpensesModel(
    title: "Movie",
    amount: 70.0,
    date: DateTime.now(),
    category: CategoryEnum.leisure,
  ),
  ExpensesModel(
    title: "Go To Moon",
    amount: 1_000_000.0,
    date: DateTime.now(),
    category: CategoryEnum.travel,
  ),
];
