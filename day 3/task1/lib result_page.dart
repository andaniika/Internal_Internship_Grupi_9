import 'package:flutter/material.dart';
import 'quiz_page.dart';

class ResultPage extends StatelessWidget {

  final int score;

  const ResultPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Result'),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              'Quiz Finished!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Your Score: $score / 5',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(

              onPressed: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuizPage(),
                  ),
                );

              },

              child: const Text('Restart Quiz'),

            ),

          ],

        ),

      ),

    );

  }

}
