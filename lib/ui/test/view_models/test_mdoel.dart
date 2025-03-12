import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trivia_app/models/cubic_question.dart';
import 'package:trivia_app/models/test_score_db.dart';
import 'package:trivia_app/repositories/db.dart';
import 'package:trivia_app/ui/home/view_models/home_view_model.dart';


class QuestionsCubit extends Cubit<QuestionsState> {
  int userScore = 0;
  List<QuestionItem> _questions = [];

  QuestionsCubit() : super(QuestionsInitial());

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
      ));
    }
  }

  void increaseScore() {
    userScore++;
    if (state is QuestionsLoaded) {
      emit(QuestionsLoaded(
        questions: _questions,
        userScore: userScore,
      ));
    }
  }
}


Future<List<QuestionItem>> getRandomQuestions(BuildContext context) async {
  final isar = await Database.instance;
  // Obtiene el idioma del cubit; si no hay, usa English por defecto.
  final lang = context.read<LanguageCubit>().state ?? "English";

  if (lang == "Français") {
    // Consulta todas las preguntas de la colección francesa
    final allQuestions = await isar.questionsFrenchs.where().findAll();
    allQuestions.shuffle(); // Mezcla la lista
    final selected = allQuestions.take(10).toList();
    // Mapea cada objeto a QuestionItem.
    return selected.map((q) {
      return QuestionItem(
        order: q.order,
        text: q.questionText,
        answers: q.answrs,
        correctAnswerIndex: q.answrs.indexWhere((a) => a == q.correctAnswers),
      );
    }).toList();
  } else {
    // Consulta todas las preguntas de la colección en inglés
    final allQuestions = await isar.questionsEnglishs.where().findAll();
    allQuestions.shuffle();
    final selected = allQuestions.take(10).toList();
    return selected.map((q) {
      return QuestionItem(
        order: q.order,
        text: q.questionText,
        answers: q.answrs,
        correctAnswerIndex: q.answrs.indexWhere((a) => a == q.correctAnswers),
      );
    }).toList();
  }
}

