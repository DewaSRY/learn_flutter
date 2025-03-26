import 'package:flutter/material.dart';

class QuizAnswerButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const QuizAnswerButton({required this.buttonText, required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        backgroundColor:  Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(buttonText),
    );
  }
}
