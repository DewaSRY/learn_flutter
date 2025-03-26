import 'package:flutter/material.dart';
import 'modela/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_answer_button.dart';
import 'main_wrapper.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    required this.handleAnswer,
    required this.answer,
    required this.questionList,
    super.key,
  });

  final void Function(String) handleAnswer;
  final List<String> answer;
  final List<QuizQuestion> questionList;

  @override
  State<StatefulWidget> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {

  void handleAnswer(String answer){
    setState(() {
      widget.handleAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.answer.length;
    QuizQuestion question = widget.questionList[currentIndex];

    return MainWrapper(
      children: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                question.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ...question.getShuffledAnswer().map((item) =>
                  QuizAnswerButton(buttonText: item, onTap: () => handleAnswer(item))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
