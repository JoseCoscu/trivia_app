import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class TestModel extends ChangeNotifier {
  final Map<String, int> _results = {};

  Map<String, int> get res => _results;

  int? getResult({required key}) {
    return _results[key];
  }

  void add({required String key, required int value}) {
    _results[key] = value;
  }
}

class QuestionsModel extends ChangeNotifier {
  List<QuestionItem> _questions = [];
  String jsonFile;
  bool isLoading = true;
  int userScore = 0;

  QuestionsModel({required this.jsonFile}) {
    _loadQuestions();
  }

  void restoreScore() {
    userScore = 0;
  }

  void increaseScore() {
    userScore++;
  }

  Future<void> _loadQuestions() async {
    try {
      isLoading = true;
      notifyListeners(); // Notificar antes de cargar nuevas preguntas

      final String response = await rootBundle.loadString(jsonFile);
      final List<dynamic> data = jsonDecode(response);

      _questions = data.map<QuestionItem>((item) {
        return QuestionItem(
          order: item['order'],
          text: item['questions'][0]['content']['es'], // Pregunta en español
          answers:
              List<String>.from(item['answers'].map((a) => a['content']['es'])),
          correctAnswerIndex:
              item['answers'].indexWhere((a) => a['isCorrect'] == true),
        );
      }).toList();
    } catch (e) {
      print("Error al cargar preguntas: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateJsonFile(String newJsonFile) {
    jsonFile = newJsonFile;
    _loadQuestions();
  }

  List<QuestionItem> get questions => _questions;

  int get score => userScore;

  QuestionItem getByIndex(int index) {
    if (index < 0 || index >= _questions.length) {
      throw Exception("Index out of range");
    }
    return _questions[index];
  }
}

class QuestionItem {
  final int order;
  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  QuestionItem({
    required this.order,
    required this.text,
    required this.answers,
    required this.correctAnswerIndex,
  });
}
