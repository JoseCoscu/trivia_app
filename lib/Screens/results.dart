import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/models/questions.dart';
import 'package:trivia_app/screens/test3.dart';
import 'package:trivia_app/main.dart';

class TestResultsScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int wrongAnswers;
  final String testName;

  const TestResultsScreen(
      {super.key,
      required this.correctAnswers,
      required this.totalQuestions,
      required this.wrongAnswers,
      required this.testName});

  @override
  State<TestResultsScreen> createState() => _TestResultsScreenState();
}

class _TestResultsScreenState extends State<TestResultsScreen> {
  @override
  void initState() {
    super.initState();
    saveResults();
  }

  void saveResults() {
    Provider.of<TestModel>(context, listen: false)
        .add(key: widget.testName, value: widget.correctAnswers);
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(title: const Text("Resultados del Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${percentage.toStringAsFixed(1)}%",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "${widget.correctAnswers} / ${widget.totalQuestions} aciertos",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              "Errores cometidos: ${widget.wrongAnswers}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Provider.of<QuestionsModel>(context, listen: false)
                    .restoreScore();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test()),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              child: const Text("Repetir Test"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
