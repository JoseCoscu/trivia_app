import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';



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



/// Estados para el QuestionsCubit
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsLoaded extends QuestionsState {
  final List<QuestionItem> questions;
  final int userScore;

  QuestionsLoaded({
    required this.questions,
    required this.userScore
  });
}

class QuestionsError extends QuestionsState {
  final String message;
  QuestionsError(this.message);
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
      final response =
          await dio.get('https://api.verbos.com/v1/get-questions/canada');

      emit(ApiSuccess(response.data));
    } catch (e) {
      emit(ApiError("Error al obtener preguntas: $e"));
    }
  }
}
