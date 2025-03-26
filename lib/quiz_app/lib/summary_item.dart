import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    required this.questionIndex,
    required this.questionText,
    required this.rightAnswer,
    required this.answer,
    super.key,
  });

  final int questionIndex;
  final String questionText;
  final String rightAnswer;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color:
                  rightAnswer == answer ? Colors.greenAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              questionIndex.toString(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(questionText, style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text(rightAnswer, style: TextStyle(fontSize: 16),),
                  SizedBox(height: 4),
                  Text("Answer : $answer", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
