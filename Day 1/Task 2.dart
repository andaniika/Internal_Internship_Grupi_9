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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GradeCalculatorPage(),
    );
  }
}

class GradeCalculatorPage extends StatefulWidget {
  const GradeCalculatorPage({super.key});

  @override
  State<GradeCalculatorPage> createState() => _GradeCalculatorPageState();
}

class _GradeCalculatorPageState extends State<GradeCalculatorPage> {
  final TextEditingController grade1Controller = TextEditingController();
  final TextEditingController grade2Controller = TextEditingController();
  final TextEditingController grade3Controller = TextEditingController();

  String result = '';
  String status = '';

  void calculateAverage() {
    if (grade1Controller.text.isEmpty ||
        grade2Controller.text.isEmpty ||
        grade3Controller.text.isEmpty) {
      setState(() {
        result = 'Please fill in all fields.';
        status = '';
      });
      return;
    }

    final double? grade1 = double.tryParse(grade1Controller.text);
    final double? grade2 = double.tryParse(grade2Controller.text);
    final double? grade3 = double.tryParse(grade3Controller.text);

    if (grade1 == null || grade2 == null || grade3 == null) {
      setState(() {
        result = 'Please enter valid numbers.';
        status = '';
      });
      return;
    }

    double average = (grade1 + grade2 + grade3) / 3;

    setState(() {
      result = average.toStringAsFixed(2);
      status = average >= 50
          ? 'Pass'
          : 'Needs Improvement';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Enter Three Grades',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: grade1Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Grade 1',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: grade2Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Grade 2',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: grade3Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Grade 3',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: calculateAverage,
                      child: const Text('Calculate'),
                    ),

                    const SizedBox(height: 20),

                    if (result.isNotEmpty)
                      Text(
                        'Average: $result',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 10),

                    if (status.isNotEmpty)
                      Text(
                        'Status: $status',
                        style: TextStyle(
                          fontSize: 18,
                          color: status == 'Pass'
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
        ),
      ),
    );
  }
}
