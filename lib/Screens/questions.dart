import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<Question>> loadQuestions() async {
  final String response = await rootBundle.loadString('assets/test_1.json');
  final List<dynamic> data = jsonDecode(response);

  return data.map((q) => Question.fromJson(q)).toList();
}

class Question {
  final String questionText;
  final Answer correctAnswer;

  Question({required this.questionText, required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questions'][0]['content']['es'],
      correctAnswer: (json['answers'] as List)
          .map((ans) => Answer.fromJson(ans))
          .firstWhere((ans) => ans.isCorrect), // Solo la respuesta correcta
    );
  }
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      text: json['content']['es'],
      isCorrect: json['isCorrect'],
    );
  }
}

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
    futureQuestions = loadQuestions();
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
                          _showAnswers[index] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
                            "✅ ${question.correctAnswer.text}",
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
