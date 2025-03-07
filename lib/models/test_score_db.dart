import 'package:isar/isar.dart';

part 'test_score_db.g.dart';

@collection
class TestResult {
  Id id = Isar.autoIncrement; // ID autoincremental
  late String testName; // Nombre del test
  late int score; // Puntuación
  DateTime date = DateTime.now(); // Fecha del test

  final questions = IsarLinks<TestQuestion>(); // Relación con preguntas
}

@collection
class TestQuestion {
  Id id = Isar.autoIncrement; // ID autoincremental
  late String questionText; // Texto de la pregunta
  late String correctAnswer; // Respuesta correcta
  late String userAnswer; // Respuesta del usuario

  final testResult = IsarLink<TestResult>(); // Relación con TestResult
}

@collection
class QuestionsEnglish {
  Id id = Isar.autoIncrement; // ID autoincremental
  late String questionText; // Texto de la pregunta
  late int order;
  late List<String> answrs;
  late String correctAnswers; // Respuesta correcta
}

@collection
class QuestionsFrench {
  Id id = Isar.autoIncrement; // ID autoincremental
  late String questionText; // Texto de la pregunta
  late int order;
  late List<String> answrs; // Posibles Respuestas
  late String correctAnswers; // Respuestas correctas
}
