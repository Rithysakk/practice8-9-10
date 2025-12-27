class Question {
  final String title;
  final List<String> possibleAnswers;
  final String correctAnswer;

  const Question({
    required this.title,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  bool isCorrect(String answer) {
    return answer == correctAnswer;
  }
}

class Quiz {
  final String title;
  final List<Question> questions;

  const Quiz({
    required this.title,
    required this.questions,
  });
}

class Submission {
  final Question question;
  final String? userAnswer;

  const Submission({
    required this.question,
    this.userAnswer,
  });

  bool isCorrect() {
    return userAnswer != null && question.isCorrect(userAnswer!);
  }

  String? get correctAnswer => question.correctAnswer;
}
