import 'package:flutter/material.dart';
import 'main_wrapper.dart';
import 'summary_container.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({
    required this.summary,
    required this.handleReset,
    super.key,
  });

  final List<Map<String, Object>> summary;
  final void Function() handleReset;

  @override
  State<StatefulWidget> createState() {
    return _SummaryScreen();
  }
}

class _SummaryScreen extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    int questionAmount = widget.summary.length;
    int rightAmount =
        widget.summary
            .where((v) => v["right_answer"] == v["answer"])
            .toList()
            .length;

    return MainWrapper(
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Congratulation, you right $rightAmount from $questionAmount question amount",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          SummaryContainer(summary: widget.summary),
          SizedBox(height: 45),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color.fromARGB(100, 237, 223, 252)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              foregroundColor: Colors.white,
            ),
            onPressed: widget.handleReset,
            label: Text("reset", style: TextStyle(fontSize: 16),),
            icon: Icon(Icons.recycling, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
