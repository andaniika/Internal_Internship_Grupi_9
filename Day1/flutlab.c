import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text("Profile Card"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.blueGrey,
              ),
              const SizedBox(height: 20),
              const Text(
                "Dora Ademi",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter Intern",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text("dora@email.com"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text("+383 44 123 456"),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  print("Contact button clicked");
                },
                child: const Text("Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
