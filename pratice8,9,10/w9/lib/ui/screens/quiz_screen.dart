import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';
import 'welcome_screen.dart';
import 'question_screen.dart';
import 'result_screen.dart';

enum QuizState { welcome, inProgress, completed }

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizState _state = QuizState.welcome;
  int _currentQuestionIndex = 0;
  final List<Submission> _submissions = [];

  void _startQuiz() {
    setState(() {
      _state = QuizState.inProgress;
      _currentQuestionIndex = 0;
      _submissions.clear();
    });
  }

  void _answerQuestion(String answer) {
    final question = widget.quiz.questions[_currentQuestionIndex];
    
    setState(() {
      _submissions.add(Submission(
        question: question,
        userAnswer: answer,
      ));

      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _state = QuizState.completed;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _state = QuizState.welcome;
      _currentQuestionIndex = 0;
      _submissions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_state) {
        QuizState.welcome => WelcomeScreen(onStart: _startQuiz),
        QuizState.inProgress => QuestionScreen(
            question: widget.quiz.questions[_currentQuestionIndex],
            questionNumber: _currentQuestionIndex + 1,
            totalQuestions: widget.quiz.questions.length,
            onAnswerSelected: _answerQuestion,
          ),
        QuizState.completed => ResultScreen(
            submissions: _submissions,
            onRestart: _restartQuiz,
          ),
      },
    );
  }
}
