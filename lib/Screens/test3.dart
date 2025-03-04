import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/Screens/results.dart';
import 'package:trivia_app/models/questions.dart';
import 'package:trivia_app/models/test_score_db.dart';
import 'package:trivia_app/database/db.dart'; // Importa la base de datos

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test")),
      body: Consumer<QuestionsModel>(builder: (context, questionsModel, child) {
        if (questionsModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Question(
          questions: questionsModel.questions,
          testName: questionsModel.jsonFile,
        );
      }),
    );
  }
}

class Question extends StatefulWidget {
  final List<QuestionItem> questions;
  final String testName;

  const Question({super.key, required this.questions, required this.testName});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int index = 0;
  int results = 0;
  int wrongAnsw = 0;
  List<Color> buttonColors = [];
  bool buttonsDisabled = false;
  Map<int, int> selectedAnswers = {}; // Guarda las respuestas seleccionadas

  @override
  void initState() {
    super.initState();
    _initializeAnswerColors();
  }

  void _initializeAnswerColors() {
    if (widget.questions.isNotEmpty) {
      buttonColors = List.generate(widget.questions[index].answers.length, (i) => Colors.blue);
      buttonsDisabled = false;
    }
  }

  void checkAnswer(int i) {
    if (buttonsDisabled) return;
    final increaseScore = Provider.of<QuestionsModel>(context, listen: false).increaseScore;
    
    setState(() {
      buttonsDisabled = true;
      bool isCorrect = widget.questions[index].correctAnswerIndex == i;
      buttonColors[i] = isCorrect ? Colors.green : Colors.red;
      selectedAnswers[index] = i; // Guarda la respuesta seleccionada

      if (!isCorrect) {
        wrongAnsw++;
      } else {
        increaseScore();
        results++;
      }
    });
  }

  Future<void> saveResultToDB() async {
    final isar = await Database.instance;

    await isar.writeTxn(() async {
      TestResult? testResult;

      // Verificar si ya existe un resultado con el mismo testName
      final existingResults = await isar.testResults
          .filter()
          .testNameEqualTo(widget.testName)
          .findAll();

      if (existingResults.isNotEmpty) {
        // Si existe, actualizar la puntuación
        testResult = existingResults.first;
        testResult.score = results;

        await isar.testResults.put(testResult);

        // Eliminar preguntas previas asociadas
        await isar.testQuestions
            .filter()
            .testResult((t) => t.idEqualTo(testResult!.id!))
            .deleteAll();
      } else {
        // Si no existe, crear un nuevo resultado
        testResult = TestResult()
          ..testName = widget.testName
          ..score = results;

        testResult.id = await isar.testResults.put(testResult);
      }

      // Crear preguntas asociadas al test
      final List<TestQuestion> questionEntries = widget.questions.asMap().entries.map((entry) {
        final idx = entry.key;
        final question = entry.value;

        return TestQuestion()
          ..questionText = question.text
          ..correctAnswer = question.answers[question.correctAnswerIndex]
          ..userAnswer = selectedAnswers.containsKey(idx)
              ? question.answers[selectedAnswers[idx]!]
              : "No respondida"
          ..testResult.value = testResult;
      }).toList();

      await isar.testQuestions.putAll(questionEntries);

      // Relacionar preguntas con el test y guardar enlaces
      testResult.questions.addAll(questionEntries);
      await testResult.questions.save();
    });
  }

  void nextQuestion() async {
    if (index + 1 == widget.questions.length) {
      await saveResultToDB(); // Guardar resultados antes de navegar
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestResultsScreen(
            correctAnswers: results,
            wrongAnswers: wrongAnsw,
            totalQuestions: widget.questions.length,
            testName: widget.testName,
          ),
        ),
      );
    } else {
      setState(() {
        index++;
        _initializeAnswerColors();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.questions.isEmpty
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Text("${index + 1} / ${widget.questions.length}"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.questions[index].text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: List.generate(
                          widget.questions[index].answers.length,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ElevatedButton(
                              onPressed: buttonsDisabled ? null : () => checkAnswer(i),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(buttonColors[i]),
                                foregroundColor: WidgetStateProperty.all(Colors.white),
                                padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text(
                                widget.questions[index].answers[i],
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: buttonsDisabled ? nextQuestion : null,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              buttonsDisabled ? Colors.blue : Colors.grey),
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                        child: const Text("Next Question"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
