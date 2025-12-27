import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final List<Submission> submissions;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.submissions,
    required this.onRestart,
  });

  int get correctAnswersCount {
    return submissions.where((submission) => submission.isCorrect()).length;
  }

  int get totalQuestions => submissions.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'You answered $correctAnswersCount on $totalQuestions!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: submissions.length,
                  itemBuilder: (context, index) {
                    final submission = submissions[index];
                    final isCorrect = submission.isCorrect();
                    final questionNumber = index + 1;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: isCorrect ? Colors.green : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$questionNumber',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  submission.question.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildAnswerRow(
                            'Your answer:',
                            submission.userAnswer ?? 'No answer',
                            isCorrect ? Colors.green : Colors.red,
                          ),
                          if (!isCorrect) ...[
                            const SizedBox(height: 8),
                            _buildAnswerRow(
                              'Correct answer:',
                              submission.correctAnswer ?? '',
                              Colors.green,
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: AppButton(
                text: 'Restart Quiz',
                onPressed: onRestart,
                icon: Icons.restart_alt,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerRow(String label, String answer, Color color) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          answer,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
