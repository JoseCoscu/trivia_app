import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:trivia_app/models/test_score_db.dart'; // Importa tu modelo
import 'package:trivia_app/repositories/db.dart'; // Importa la base de datos

class TestHistoryScreen extends StatefulWidget {
  const TestHistoryScreen({super.key});

  @override
  State<TestHistoryScreen> createState() => _TestHistoryScreenState();
}

class _TestHistoryScreenState extends State<TestHistoryScreen> {
  late Future<List<TestResult>> _testResults;

  @override
  void initState() {
    super.initState();
    _testResults = _fetchTestResults();
  }

  Future<List<TestResult>> _fetchTestResults() async {
    final isar = await Database.instance;
    return await isar.testResults.where().findAll();
  }

  Future<List<TestQuestion>> _fetchTestQuestions(int testResultId) async {
  final isar = await Database.instance;
  final testResult = await isar.testResults.get(testResultId);
  if (testResult == null) {
    print("No se encontró TestResult con ID $testResultId");
    return [];
  }
  await testResult.questions.load(); // Carga la relación
  return testResult.questions.toList();
}

  void _showTestDetail(TestResult test) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        // Usamos un Container con altura fija para darle tiempo a la query
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<TestQuestion>>(
            future: _fetchTestQuestions(test.id ?? 0),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "No hay preguntas asociadas a este test.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              final questions = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Detalles del Test: ${test.testName}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];
                        final bool isCorrect = question.userAnswer == question.correctAnswer;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pregunta ${index + 1}: ${question.questionText}",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 8),
                                if (isCorrect)
                                  Text(
                                    "Respuesta correcta: ${question.correctAnswer}",
                                    style: const TextStyle(
                                        color: Colors.green, fontWeight: FontWeight.bold),
                                  )
                                else ...[
                                  Text(
                                    "Tu respuesta: ${question.userAnswer}",
                                    style: const TextStyle(
                                        color: Colors.red, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Respuesta correcta: ${question.correctAnswer}",
                                    style: const TextStyle(
                                        color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    child: const Text(
                      "Cerrar",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Tests"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<TestResult>>(
        future: _testResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Todavía no existen resultados para mostrar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            );
          }

          final results = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final test = results[index];
                    final displayName = test.testName.replaceAll("assets/", "").replaceAll(".json", "");
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          displayName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        ),
                        subtitle: Text("Puntuación: ${test.score}"),
                        trailing: const Icon(Icons.visibility, color: Colors.blueAccent),
                        onTap: () => _showTestDetail(test),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Volver al Home",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
