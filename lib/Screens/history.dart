import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/models/questions.dart';

class TestHistoryScreen extends StatelessWidget {
  const TestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el historial de pruebas desde el modelo
    final Map<String, int> testHistory = Provider.of<TestModel>(context, listen: false).res;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Tests"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<QuestionsModel>(
        builder: (context, testModel, child) {
          if (testHistory.isEmpty) {
            return const Center(
              child: Text(
                "Todavía no existen resultados para mostrar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: testHistory.length,
                  itemBuilder: (context, index) {
                    String testName = testHistory.keys.elementAt(index);
                    int testScore = testHistory[testName]!;
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: ExpansionTile(
                        title: Text(
                          testName,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Puntuación: $testScore",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                            ),
                          ),
                        ],
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Volver al Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
