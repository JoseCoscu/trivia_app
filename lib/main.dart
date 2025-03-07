import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:trivia_app/database/db.dart';
import 'package:trivia_app/models/test_score_db.dart';
import 'package:trivia_app/screens/history.dart';
import 'package:trivia_app/screens/questions.dart';
import 'package:trivia_app/screens/test3.dart';
import 'package:trivia_app/models/cubic_question.dart';

/// Función para seleccionar un archivo JSON aleatorio
Future<String> getRandomJsonFile() async {
  try {
    final List<String> jsonFiles = [
      'assets/test_1.json',
      'assets/test_2.json',
      'assets/test_3.json',
      'assets/test_4.json',
      'assets/test_5.json',
    ];

    if (jsonFiles.isEmpty) {
      throw Exception("No hay archivos JSON disponibles.");
    }

    final random = Random();
    String selectedFile = jsonFiles[random.nextInt(jsonFiles.length)];
    return selectedFile;
  } catch (e) {
    print("Error al seleccionar un archivo JSON: $e");
    return "assets/test_1.json";
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String randomJson = await getRandomJsonFile();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<QuestionsCubit>(
          create: (context) => QuestionsCubit(jsonFile: randomJson),
        ),
        BlocProvider<TestCubit>(
          create: (context) => TestCubit(),
        ),
        BlocProvider<ApiCubit>(
          create: (context) => ApiCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const HomeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: const Color.fromARGB(255, 22, 28, 122),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

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
