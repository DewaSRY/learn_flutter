

import 'package:flutter/material.dart';

class ExpensesToolBarWidget extends StatelessWidget{

  final String title;
  final void Function() onTap;

  const ExpensesToolBarWidget({
    required this.onTap,
    required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 12,right: 12, top:  30, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.add),
          )
        ],

      ),
    );
  }

}