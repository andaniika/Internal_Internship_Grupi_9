import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}


class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizScreen(),
    );
  }
}


// MODEL CLASS
class Question {
  String question;
  List<String> options;
  String answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}


// QUIZ SCREEN
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}


class _QuizScreenState extends State<QuizScreen> {

  int currentQuestion = 0;
  int score = 0;


  List<Question> questions = [

    Question(
      question: "What is Flutter?",
      options: [
        "Database",
        "Framework",
        "Browser",
        "Operating System"
      ],
      answer: "Framework",
    ),


    Question(
      question: "Which language does Flutter use?",
      options: [
        "Java",
        "Python",
        "Dart",
        "C"
      ],
      answer: "Dart",
    ),


    Question(
      question: "Which widget changes with data?",
      options: [
        "StatefulWidget",
        "Text",
        "Icon",
        "Container"
      ],
      answer: "StatefulWidget",
    ),


    Question(
      question: "What does setState do?",
      options: [
        "Deletes app",
        "Updates UI",
        "Creates database",
        "Closes app"
      ],
      answer: "Updates UI",
    ),


    Question(
      question: "Which is used for navigation?",
      options: [
        "Navigator",
        "Scanner",
        "Printer",
        "Compiler"
      ],
      answer: "Navigator",
    ),

  ];


  void checkAnswer(String selectedAnswer) {

    setState(() {

      if(selectedAnswer ==
          questions[currentQuestion].answer) {

        score++;

      }


      if(currentQuestion < questions.length - 1) {

        currentQuestion++;

      } else {


        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(
              score: score,
              restart: restartQuiz,
            ),
          ),
        );

      }

    });

  }



  void restartQuiz() {

    setState(() {

      currentQuestion = 0;
      score = 0;

    });

  }



  @override
  Widget build(BuildContext context) {

    Question q = questions[currentQuestion];


    return Scaffold(

      appBar: AppBar(
        title: const Text("Quiz App"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            Text(
              "Question ${currentQuestion + 1}/${questions.length}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),


            const SizedBox(height: 30),


            Text(
              q.question,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),


            const SizedBox(height: 30),


            ...q.options.map(
              (option) {

                return Container(

                  width: double.infinity,

                  margin: const EdgeInsets.only(bottom:10),


                  child: ElevatedButton(

                    onPressed: () {
                      checkAnswer(option);
                    },


                    child: Text(option),

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



// RESULT SCREEN

class ResultScreen extends StatelessWidget {

  final int score;
  final Function restart;


  const ResultScreen({
    super.key,
    required this.score,
    required this.restart,
  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Result"),
      ),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            Text(
              "Your Score:",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),


            Text(
              "$score / 5",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height:30),


            ElevatedButton(

              onPressed: () {

                restart();

                Navigator.pop(context);

              },


              child: const Text("Restart"),

            )


          ],

        ),

      ),

    );

  }

}
