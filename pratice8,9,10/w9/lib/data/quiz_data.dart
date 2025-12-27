import '../model/quiz_model.dart';

final Quiz sampleQuiz = Quiz(
  title: "Flutter Quiz",
  questions: [
    const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["Ronan", "Hongly", "Leangsiv"],
      correctAnswer: "Ronan",
    ),
    const Question(
      title: "What is the best color?",
      possibleAnswers: ["Blue", "Red", "Green"],
      correctAnswer: "Green",
    ),
    const Question(
      title: "Which language does Flutter use?",
      possibleAnswers: ["Java", "Dart", "Python"],
      correctAnswer: "Dart",
    ),
    const Question(
      title: "What is Flutter?",
      possibleAnswers: ["Framework", "Library", "Language"],
      correctAnswer: "Framework",
    ),
  ],
);
