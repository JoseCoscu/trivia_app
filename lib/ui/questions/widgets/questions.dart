import 'package:flutter/material.dart';
import 'package:trivia_app/ui/questions/view_models/question_model.dart';

/// Función para cargar las preguntas desde la BD según el idioma seleccionado


class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late Future<List<Question>> futureQuestions;
  List<bool> _showAnswers = [];

  @override
  void initState() {
    super.initState();
    futureQuestions = loadQuestions(context);
    futureQuestions.then((questions) {
      setState(() {
        _showAnswers = List.generate(questions.length, (_) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Preguntas')),
      body: FutureBuilder<List<Question>>(
        future: futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay preguntas disponibles.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final question = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          question.questionText,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          _showAnswers[index]
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                        onTap: () {
                          setState(() {
                            _showAnswers[index] = !_showAnswers[index];
                          });
                        },
                      ),
                      if (_showAnswers[index])
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "✅ ${question.correctAnswer}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
