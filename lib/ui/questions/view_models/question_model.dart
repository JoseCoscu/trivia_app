import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trivia_app/database/db.dart';
import 'package:trivia_app/models/cubic_question.dart';
import 'package:trivia_app/models/test_score_db.dart';

Future<List<Question>> loadQuestions(BuildContext context) async {
  final isar = await Database.instance;
  final lang = context.read<LanguageCubit>().state ?? "English";

  if (lang == "Français") {
    final questions = await isar.questionsFrenchs.where().findAll();
    return questions
        .map((q) => Question(
              questionText: q.questionText,
              answers: q.answrs,
              correctAnswer: q.correctAnswers,
            ))
        .toList();
  } else {
    final questions = await isar.questionsEnglishs.where().findAll();
    return questions
        .map((q) => Question(
              questionText: q.questionText,
              answers: q.answrs,
              correctAnswer: q.correctAnswers,
            ))
        .toList();
  }
}

/// Modelo de pregunta para la UI
class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });
}