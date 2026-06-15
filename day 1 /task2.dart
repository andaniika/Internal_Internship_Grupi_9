import 'package:flutter/material.dart';

void main() {
  runApp(const GradeCalculatorApp());
}

class GradeCalculatorApp extends StatelessWidget {
  const GradeCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator',
      home: const GradeCalculatorScreen(),
    );
  }
}

class GradeCalculatorScreen extends StatefulWidget {
  const GradeCalculatorScreen({super.key});

  @override
  State<GradeCalculatorScreen> createState() =>
      _GradeCalculatorScreenState();
}

class _GradeCalculatorScreenState
    extends State<GradeCalculatorScreen> {
  final TextEditingController grade1Controller =
      TextEditingController();

  final TextEditingController grade2Controller =
      TextEditingController();

  final TextEditingController grade3Controller =
      TextEditingController();

  String result = "";
  String status = "";

  void calculateAverage() {
    if (grade1Controller.text.isEmpty ||
        grade2Controller.text.isEmpty ||
        grade3Controller.text.isEmpty) {
      setState(() {
        result = "Please fill all fields.";
        status = "";
      });
      return;
    }

    try {
      double grade1 =
          double.parse(grade1Controller.text);

      double grade2 =
          double.parse(grade2Controller.text);

      double grade3 =
          double.parse(grade3Controller.text);

      double average =
          (grade1 + grade2 + grade3) / 3;

      setState(() {
        result =
            "Average: ${average.toStringAsFixed(2)}";

        if (average >= 50) {
          status = "Pass";
        } else {
          status = "Needs Improvement";
        }
      });
    } catch (e) {
      setState(() {
        result = "Please enter valid numbers.";
        status = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F7FA),
      appBar: AppBar(
        title: const Text("Grade Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                )
              ],
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blueGrey,
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: grade1Controller,
                  keyboardType:
                      TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Grade 1",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: grade2Controller,
                  keyboardType:
                      TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Grade 2",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: grade3Controller,
                  keyboardType:
                      TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Grade 3",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: calculateAverage,
                  child: const Text(
                    "Calculate Average",
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  status,
                  style: TextStyle(
                    fontSize: 18,
                    color: status == "Pass"
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
