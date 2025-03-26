

class QuizQuestion{
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswer(){
    List<String> shuffledStringList= List.of(answers);
    shuffledStringList.shuffle();
    return shuffledStringList;
  }
}