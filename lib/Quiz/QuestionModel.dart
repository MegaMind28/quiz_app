class Question {
  final int id;
  final String question;
  final String correct_answer;
  final List incorrect_answers;

  Question({
     this.id,
     this.question,
     this.correct_answer,
     this.incorrect_answers,
  });
}