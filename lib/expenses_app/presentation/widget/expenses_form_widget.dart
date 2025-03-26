import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_learn/expenses_app/domain/entities/category_model.dart';
import 'package:max_learn/expenses_app/utils/regex_app.dart';
import 'package:max_learn/expenses_app/utils/third_library.dart';

class ExpensesFormWidget extends StatefulWidget {
  const ExpensesFormWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesFormWidget();
}

class _ExpensesFormWidget extends State<ExpensesFormWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String selectedDateText = "Select Date *";
  DateTime? selectedDateTime;
  CategoryEnum? selectedCategory;

  void _showDatePicker() {
    final currentDate = DateTime.now();

    final firstDate = currentDate.subtract(Duration(days: 10));
    final lastDate = currentDate.add(Duration(days: 10));

    showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((selectedDate) {
      selectedDateTime = selectedDate;

      if (selectedDate == null) {
        setState(() {
          selectedDateText = "Select Date *";
        });
      } else {
        setState(() {
          selectedDateText = dateFormat.format(selectedDate);
        });
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(4),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(label: Text("Title *")),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value == null) return null;

                        if (RegexApp.amountPattern.hasMatch(value)) {
                          return null;
                        }

                        return "please provide valid amount ";
                      },
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: "\$",
                        labelText: "Amount *",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Selected Date *"),
                            if (selectedDateTime != null)
                              Text(
                                selectedDateText,
                                style: TextStyle(fontSize: 11),
                              ),
                          ],
                        ),
                        IconButton(
                          onPressed: _showDatePicker,
                          icon: Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton<CategoryEnum>(
                    value: CategoryEnum.values.first,
                    items:
                        CategoryEnum.values
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        SizedBox(width: 8), // Space between buttons
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Save Expenses"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
