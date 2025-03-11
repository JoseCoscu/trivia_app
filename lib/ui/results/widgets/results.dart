import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/cubic_question.dart';
import 'package:trivia_app/ui/home/widgets/home_page.dart';
import 'package:trivia_app/ui/test/widgets/test.dart';


class TestResultsScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int wrongAnswers;
  final String testName;

  const TestResultsScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.wrongAnswers,
    required this.testName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestResultsCubit()..saveResults(testName, correctAnswers),
      child: BlocBuilder<TestResultsCubit, TestResultsState>(
        builder: (context, state) {
          double percentage = (correctAnswers / totalQuestions) * 100;

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
                    "$correctAnswers / $totalQuestions aciertos",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Errores cometidos: $wrongAnswers",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TestScreen()),
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
        },
      ),
    );
  }
}
