import 'package:flutter/material.dart';
import 'main_wrapper.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const StartScreen(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      children: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 45),
          Text(
            "learn Flutter the fun way",
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          SizedBox(height: 45),
          OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color.fromARGB(100, 237, 223, 252)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              foregroundColor: Colors.white,
            ),
            label: Text(
              'Start',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
              ),
            ),
            icon: Icon(Icons.arrow_right_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
