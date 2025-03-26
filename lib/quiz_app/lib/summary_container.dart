import 'package:flutter/material.dart';
import 'summary_item.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({required this.summary, super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child:SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          summary.map((item) {
            return SummaryItem(
              questionIndex: item["question_idx"] as int,
              questionText: item["question_text"] as String,
              rightAnswer: item["right_answer"] as String,
              answer: item["answer"] as String,
            );
          }).toList(),
        )
      )
    );
  }
}
