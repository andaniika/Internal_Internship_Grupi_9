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
      title: 'Profile Card App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Elisa',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Flutter Intern',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Passionate about learning Flutter and building modern mobile applications.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.email, color: Colors.indigo),
                      SizedBox(width: 8),
                      Text('elisa@example.com'),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, color: Colors.green),
                      SizedBox(width: 8),
                      Text('+383 44 123 456'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Thanks for visiting my profile!',
                          ),
                        ),
                      );
                    },
                    child: const Text('Say Hello'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
