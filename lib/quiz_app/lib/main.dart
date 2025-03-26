import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'datas/question_data.dart';
import 'modela/quiz_question.dart';
import 'start_screen.dart';
import 'summary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}

class _MyApp extends State<MyApp>{
  List<QuizQuestion> quizsList = questions;
  List<String> answerList = [];
  List<Map<String, Object>> summary = [];
  Map<String, Object> statistic= {};
  String _activeScreen = "start-screen";

  void handleAnswer(String answer){
    answerList.add(answer);

    if(answerList.length == quizsList.length){
      processAnswer();
      setState(() {
        _activeScreen = "summary-screen";
      });
    }

  }

  void processAnswer(){
    for(var i = 0; i < quizsList.length; i++){
      var currentQuiz = quizsList[i];
      var rightAnswer = currentQuiz.answers[0];
      var answer = answerList[i];
      summary.add({
        "question_idx" : i + 1,
        "question_text" : currentQuiz.text,
        "right_answer": rightAnswer,
        "answer": answer,
      });
    }
  }

  void startQuiz(){
    setState(() {
      _activeScreen = "quiz-screen";
    });
  }

  void handleRestart(){
    answerList = [];
    summary = [];

    setState(() {
      _activeScreen = "start-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = StartScreen(startQuiz);

    switch (_activeScreen) {
      case 'quiz-screen':
        activeWidget = QuizScreen(
          handleAnswer: handleAnswer,
          questionList: quizsList,
          answer: answerList,
        );
        break;
      case 'summary-screen':
        activeWidget = SummaryScreen(
          summary: summary,
          handleReset: handleRestart,
        );
        break;
      default:
        activeWidget = StartScreen(startQuiz);
        break;
    }

    return activeWidget;
  }



}