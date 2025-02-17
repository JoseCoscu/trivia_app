import 'package:flutter/material.dart';
import 'package:trivia_app/Screens/test.dart';
import 'package:trivia_app/main.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class TestResultsScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int wrongAnswers;

  const TestResultsScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.wrongAnswers,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (correctAnswers / totalQuestions) * 100;

    // Guardar los resultados al abrir la pantalla
    Future.delayed(Duration.zero, saveResults);

    return Scaffold(
      appBar: AppBar(title: Text("Resultados del Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${percentage.toStringAsFixed(1)}%",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$correctAnswers / $totalQuestions aciertos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              "Errores cometidos: $wrongAnswers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test()),
                );
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue)),
              child: Text("Repetir Test"),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text("Home"),
            )
          ],
        ),
      ),
    );
  }

  // Función para guardar los resultados en un archivo JSON
  Future<void> saveResults() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/test_results.json');

      // Crear JSON con los resultados
      Map<String, dynamic> resultsData = {
        
        "correctAnswers": correctAnswers,
        "wrongAnswers": wrongAnswers,
        "totalQuestions": totalQuestions,
        "percentage": (correctAnswers / totalQuestions * 100).toStringAsFixed(1),
        "timestamp": DateTime.now().toIso8601String(),
      };

      String jsonData = jsonEncode(resultsData);
      await file.writeAsString(jsonData);

      print("Resultados guardados en ${file.path}");
    } catch (e) {
      print("Error guardando los resultados: $e");
    }
  }
}
