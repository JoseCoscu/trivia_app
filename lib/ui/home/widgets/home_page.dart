import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trivia_app/models/cubic_question.dart';
import 'package:trivia_app/models/test_score_db.dart';
import 'package:trivia_app/repositories/db.dart';
import 'package:trivia_app/ui/history/widgets/history.dart';
import 'package:trivia_app/ui/home/view_models/home_view_model.dart';
import 'package:trivia_app/ui/home/widgets/home_button.dart';
import 'package:trivia_app/ui/questions/widgets/questions.dart';
import 'package:trivia_app/ui/test/widgets/test.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedLanguage = context.read<LanguageCubit>().state;
      if (selectedLanguage == null) {
        _showLanguageDialog();
      }
    });
  }

  void saveQuestionsToDB(state, lang) async {
    final isar = await Database.instance;
    try {
      List data = state.data;

      if (lang == "English") {
        await isar.writeTxn(() async {
          for (int i = 0; i < data.length; i++) {
            bool ca = false;
            late String correctAns;
            String quest = data[i]['questions'][0]['content'][0]['text'];
            int order = data[i]['order'];
            List<String> answer = [];
            for (int j = 0; j < data[i]['answers'].length; j++) {
              if (ca && data[i]['answers'][j]["isCorrect"]) {
                continue;
              } else {
                if (data[i]['answers'][j]["isCorrect"]) {
                  ca = true;
                  correctAns = data[i]['answers'][j]["content"][0]['text'];
                }
                answer.add(data[i]['answers'][j]["content"][0]['text']);
              }
            }

            // Verificar si ya existe la pregunta con la misma respuesta correcta
            final existing = await isar.questionsEnglishs
                .filter()
                .questionTextEqualTo(quest)
                .and()
                .correctAnswersEqualTo(correctAns)
                .findFirst();

            if (existing != null) {
              // La pregunta ya existe; se omite su inserción.
              continue;
            }

            final questions = QuestionsEnglish()
              ..questionText = quest
              ..correctAnswers = correctAns
              ..order = order
              ..answrs = answer;

            questions.id = await isar.questionsEnglishs.put(questions);
          }
        });
      }

      if (lang == "Français") {
        await isar.writeTxn(() async {
          for (int i = 0; i < data.length; i++) {
            bool ca = false;
            late String correctAns;
            String quest = data[i]['questions'][0]['content'][2]['text'];
            int order = data[i]['order'];
            List<String> answer = [];
            for (int j = 0; j < data[i]['answers'].length; j++) {
              if (ca && data[i]['answers'][j]["isCorrect"]) {
                continue;
              } else {
                if (data[i]['answers'][j]["isCorrect"]) {
                  ca = true;
                  correctAns = data[i]['answers'][j]["content"][2]['text'];
                }
                answer.add(data[i]['answers'][j]["content"][2]['text']);
              }
            }

            // Verificar si ya existe la pregunta con la misma respuesta correcta
            final existing = await isar.questionsFrenchs
                .filter()
                .questionTextEqualTo(quest)
                .and()
                .correctAnswersEqualTo(correctAns)
                .findFirst();

            if (existing != null) {
              // La pregunta ya existe; se omite su inserción.
              continue;
            }

            final questions = QuestionsFrench()
              ..questionText = quest
              ..correctAnswers = correctAns
              ..order = order
              ..answrs = answer;

            questions.id = await isar.questionsFrenchs.put(questions);
          }
        });
      }
    } catch (e) {
      print("Error al guardar preguntas en la BD: $e");
      return;
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BlocBuilder<LanguageCubit, String?>(
          builder: (context, selectedLanguage) {
            return AlertDialog(
              title: const Text("Seleccione un idioma"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Elija el idioma para la aplicación"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => context
                            .read<LanguageCubit>()
                            .setLanguage("English"),
                        child: const Text("English"),
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read<LanguageCubit>()
                            .setLanguage("Français"),
                        child: const Text("Français"),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: selectedLanguage != null
                      ? () {
                          Navigator.of(context).pop();
                          context.read<ApiCubit>().fetchQuestions();
                        }
                      : null,
                  child: const Text("Continuar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiCubit, ApiState>(
      builder: (context, state) {
        if (state is ApiLoading) {
          // Mientras se carga, se muestra solo el indicador
          return Scaffold(
            appBar: AppBar(title: const Text("Home Page")),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        ApiState data = context.read<ApiCubit>().state;
        String? lang = context.read<LanguageCubit>().state;
        saveQuestionsToDB(data, lang);

        // Si no se está cargando, se muestra la interfaz completa
        return Scaffold(
          appBar: AppBar(title: const Text("Home Page")),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                HomeButton(
                  text: 'Test',
                  icon: Icons.assessment,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                HomeButton(
                  text: 'Preguntas',
                  icon: Icons.question_answer,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Questions()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                HomeButton(
                  text: 'Historial',
                  icon: Icons.history,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestHistoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}