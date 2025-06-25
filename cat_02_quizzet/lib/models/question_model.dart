class QuestionModel{
  const QuestionModel(this.text, this.answers);
  
  final String text;
  final List<String> answers;

  //==========================================================
  // Method to get shuffled answers
  // Shuffle changes the original list, so we have to create a copy using List.of()
  // Shuffle does not return a new list, it shuffles the original list in place
  // We can't return listAbc.shuffele() because it returns void
  //==========================================================
  // You CANNOT reassign a final variable
  //==========================================================
  List<String> get shuffledAnswers {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}