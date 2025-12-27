import 'package:flutter/material.dart';
import 'data/quiz_data.dart';
import 'ui/screens/quiz_screen.dart';
 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizScreen(quiz: sampleQuiz),
  ));
}


