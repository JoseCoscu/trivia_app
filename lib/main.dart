import 'package:flutter/material.dart';
import 'package:trivia_app/Screens/questions.dart';
import 'package:trivia_app/Screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const HomeButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: const Color.fromARGB(255, 22, 28, 122),
        icon: Icon(icon, color: Colors.white,),
        label: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")), // Agregamos AppBar
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            
            HomeButton(
                text: 'Test',
                icon: Icons.assessment,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Test()),
                  );
                }),
            
            const SizedBox(height: 16),
            
            HomeButton(
                text: 'Preguntas',
                icon: Icons.question_answer,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Questions()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
