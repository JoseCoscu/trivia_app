import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:trivia_app/database/db.dart';



class LanguageCubit extends Cubit<String?> {
  LanguageCubit() : super(null);

  void setLanguage(String language) {
    emit(language);
  }
}


/// Modelo de una pregunta
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

/// Cubit para manejar los resultados del test (equivalente a TestModel)
class TestCubit extends Cubit<Map<String, int>> {
  TestCubit() : super({});

  Map<String, int> get res => state;

  int? getResult({required String key}) {
    return state[key];
  }

  void add({required String key, required int value}) {
    final updatedResults = Map<String, int>.from(state);
    updatedResults[key] = value;
    emit(updatedResults);
  }
}

/// Estados para el QuestionsCubit
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsLoaded extends QuestionsState {
  final List<QuestionItem> questions;
  final int userScore;
  final String jsonFile;

  QuestionsLoaded({
    required this.questions,
    required this.userScore,
    required this.jsonFile,
  });
}

class QuestionsError extends QuestionsState {
  final String message;
  QuestionsError(this.message);
}

/// Cubit para manejar las preguntas y la puntuación del usuario (equivalente a QuestionsModel)
class QuestionsCubit extends Cubit<QuestionsState> {
  String jsonFile;
  int userScore = 0;
  List<QuestionItem> _questions = [];

  QuestionsCubit({required this.jsonFile}) : super(QuestionsInitial()) {
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    emit(QuestionsLoading());
    try {
      final String response = await rootBundle.loadString(jsonFile);
      final List<dynamic> data = jsonDecode(response);

      _questions = data.map<QuestionItem>((item) {
        return QuestionItem(
          order: item['order'],
          text: item['questions'][0]['content']['es'],
          answers: List<String>.from(
              item['answers'].map((a) => a['content']['es'])),
          correctAnswerIndex:
              item['answers'].indexWhere((a) => a['isCorrect'] == true),
        );
      }).toList();
    } catch (e) {
      emit(QuestionsError("Error al cargar preguntas: $e"));
      return;
    }
    emit(QuestionsLoaded(
      questions: _questions,
      userScore: userScore,
      jsonFile: jsonFile,
    ));
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

  void restoreScore() {
    userScore = 0;
    if (state is QuestionsLoaded) {
      emit(QuestionsLoaded(
        questions: _questions,
        userScore: userScore,
        jsonFile: jsonFile,
      ));
    }
  }

  void increaseScore() {
    userScore++;
    if (state is QuestionsLoaded) {
      emit(QuestionsLoaded(
        questions: _questions,
        userScore: userScore,
        jsonFile: jsonFile,
      ));
    }
  }
}


class TestResultsCubit extends Cubit<TestResultsState> {
  TestResultsCubit() : super(TestResultsInitial());

  void saveResults(String testName, int correctAnswers) {
    emit(TestResultsSaved(testName, correctAnswers));
  }
}

// Estados del BLoC
abstract class TestResultsState {}

class TestResultsInitial extends TestResultsState {}

class TestResultsSaved extends TestResultsState {
  final String testName;
  final int correctAnswers;

  TestResultsSaved(this.testName, this.correctAnswers);
}


/// Estado para manejar la visibilidad de las respuestas
class AnswerVisibilityState {
  final List<bool> visibility;
  AnswerVisibilityState(this.visibility);
}

/// Cubit para manejar la visibilidad de las respuestas
class AnswerVisibilityCubit extends Cubit<AnswerVisibilityState> {
  AnswerVisibilityCubit(int length) : super(AnswerVisibilityState(List.filled(length, false)));

  void toggleVisibility(int index) {
    final newVisibility = List<bool>.from(state.visibility);
    newVisibility[index] = !newVisibility[index];
    emit(AnswerVisibilityState(newVisibility));
  }
}






/// Estados del Cubit
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final dynamic data;
  ApiSuccess(this.data);
}

class ApiError extends ApiState {
  final String message;
  ApiError(this.message);
}

/// Cubit para manejar la petición HTTP con Dio
class ApiCubit extends Cubit<ApiState> {
  final Dio dio = Dio();

  

  ApiCubit() : super(ApiInitial());

  Future<void> fetchQuestions() async {
    
  
    emit(ApiLoading());
    
    try {
      final response = await dio.get('https://api.verbos.com/v1/get-questions/canada');
      
      emit(ApiSuccess(response.data));

      
    } catch (e) {
      emit(ApiError("Error al obtener preguntas: $e"));
    }
  }
}
