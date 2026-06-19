import 'package:flutter/material.dart';
import 'question.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentQuestion = 0;
  int score = 0;

  final List<Question> questions = [

    Question(
      question: 'What is Flutter?',
      options: [
        'Programming Language',
        'Framework',
        'Database',
        'Operating System'
      ],
      correctAnswer: 1,
    ),

    Question(
      question: 'Flutter uses which language?',
      options: [
        'Java',
        'Python',
        'Dart',
        'C#'
      ],
      correctAnswer: 2,
    ),

    Question(
      question: 'Which widget can change?',
      options: [
        'StatelessWidget',
        'StatefulWidget',
        'Container',
        'Text'
      ],
      correctAnswer: 1,
    ),

    Question(
      question: 'Which function refreshes UI?',
      options: [
        'update()',
        'refresh()',
        'setState()',
        'reload()'
      ],
      correctAnswer: 2,
    ),

    Question(
      question: 'Google developed?',
      options: [
        'Flutter',
        'Laravel',
        'React',
        'Vue'
      ],
      correctAnswer: 0,
    ),

  ];

  void answerQuestion(int index) {

    if (index == questions[currentQuestion].correctAnswer) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {

      setState(() {
        currentQuestion++;
      });

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: score),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Quiz App'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Text(
              'Question ${currentQuestion + 1}/${questions.length}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              questions[currentQuestion].question,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 30),

            ...List.generate(

              questions[currentQuestion].options.length,

              (index) {

                return Padding(

                  padding: const EdgeInsets.only(bottom: 15),

                  child: ElevatedButton(

                    onPressed: () {
                      answerQuestion(index);
                    },

                    child: Text(
                      questions[currentQuestion].options[index],
                    ),

                  ),

                );

              },

            )

          ],

        ),

      ),

    );

  }

}
