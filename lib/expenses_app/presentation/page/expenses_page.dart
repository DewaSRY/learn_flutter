import 'package:flutter/material.dart';
import 'package:max_learn/expenses_app/data/datasource/expenses_dummy_data.dart';
import 'package:max_learn/expenses_app/domain/entities/expenses_model.dart';
import 'package:max_learn/expenses_app/presentation/widget/expenses_form_widget.dart';
import 'package:max_learn/expenses_app/presentation/widget/expenses_item_widget.dart';
import 'package:max_learn/expenses_app/presentation/widget/expenses_toolbar_widget.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesPage();
  }
}

class _ExpensesPage extends State<ExpensesPage> {
  List<ExpensesModel> expenses = expensesDummyList;


  addExpenses(ExpensesModel expensesItem, [int index = 0]){
    setState(() {
      expenses.insert(index, expensesItem);
    });
  }

  removeExpenses(ExpensesModel expensesItem){
    int removedIndex = expenses.indexOf(expensesItem);

    setState(() {
      expenses.remove(expensesItem);
    });

    ScaffoldMessenger.of(context)
      .showSnackBar(
      SnackBar(content: content)
    );
  }

  _openAddExpensesOverlay() {
    final containerHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Container(
          height: containerHeight,
          margin: EdgeInsets.only(top: 20),
          child: ExpensesFormWidget(),
        );
      },
    );
  }



  //TODO: make the removed expenses can be added again

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: ExpensesToolBarWidget(
          onTap: _openAddExpensesOverlay,
          title: "Expenses Chart",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (ctx, idx) {
                return Dismissible(
                  //TODO: make it removable
                  key: ValueKey(expenses[idx]),
                  child: ExpensesItemWidget(
                    expenses: expenses[idx],
                    surfaceTintColor:
                        idx % 2 == 0 ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
