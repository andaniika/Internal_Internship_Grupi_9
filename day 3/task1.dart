import 'package:flutter/material.dart';

// 1. MODELI I PYETJES
class Question {
  final String text;
  final List<Answer> answers;

  Question({required this.text, required this.answers});
}

class Answer {
  final String text;
  final int score;

  Answer({required this.text, required this.score});
}

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const QuizScreen(),
    );
  }
}

// 2. EKRANI KRYESOR I QUIZ-IT
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Të dhënat e Quiz-it
  final List<Question> _questions = [
    Question(text: 'Çfarë gjuhe përdor Flutter?', answers: [
      Answer(text: 'Java', score: 0),
      Answer(text: 'Dart', score: 10),
      Answer(text: 'C++', score: 0),
      Answer(text: 'Python', score: 0),
    ]),
    Question(text: 'Cili funksion rifreskon UI në Flutter?', answers: [
      Answer(text: 'refresh()', score: 0),
      Answer(text: 'reload()', score: 0),
      Answer(text: 'setState()', score: 10),
      Answer(text: 'updateUI()', score: 0),
    ]),
    Question(text: 'Cili Widget përdoret për listat që lëvizin?', answers: [
      Answer(text: 'Column', score: 0),
      Answer(text: 'ListView', score: 10),
      Answer(text: 'Container', score: 0),
      Answer(text: 'Stack', score: 0),
    ]),
    Question(text: 'Çka do të thotë "Hot Reload"?', answers: [
      Answer(text: 'Fikja e kompjuterit', score: 0),
      Answer(text: 'Shfaqja e ndryshimeve në sekonda', score: 10),
      Answer(text: 'Fshirja e kodit', score: 0),
      Answer(text: 'Instalimi i Flutter', score: 0),
    ]),
    Question(text: 'Cili është komanda për të krijuar projekt të ri?', answers: [
      Answer(text: 'flutter start', score: 0),
      Answer(text: 'flutter new', score: 0),
      Answer(text: 'flutter create', score: 10),
      Answer(text: 'flutter go', score: 0),
    ]),
  ];

  int _currentQuestionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Nëse s'ka më pyetje, kalo te rezultati
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: _totalScore,
              onRestart: _resetQuiz,
            ),
          ),
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _totalScore = 0;
    });
    Navigator.pop(context); // Kthehu mbrapa te Quiz-i
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Internal Internship Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pyetja ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              question.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...question.answers.map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
                  onPressed: () => _answerQuestion(answer.score),
                  child: Text(answer.text),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

// 3. EKRANI I REZULTATIT
class ResultScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.score, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rezultati Final', style: TextStyle(fontSize: 30)),
            Text(
              '$score Pikë',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Rifillo Quiz-in'),
            )
          ],
        ),
      ),
    );
  }
}
