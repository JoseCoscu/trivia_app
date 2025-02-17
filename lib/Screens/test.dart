import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:trivia_app/Screens/results.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> loadJson() async {
  final String response = await rootBundle.loadString('assets/test_1.json');
  return jsonDecode(response);
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test")),
      body: const Center(
        child: Question(),
      ),
    );
  }
}

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int index = 0;
  int results = 0;
  int wrongAnsw = 0;
  List<dynamic> questions = [];
  List<Color> buttonColors = [];
  bool buttonsDisabled = false;
  final String name = "test_1";

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final data = await loadJson();
    setState(() {
      questions = data;
      _initializeAnswerColors();
    });
  }

  void _initializeAnswerColors() {
    if (questions.isNotEmpty) {
      buttonColors =
          List.generate(questions[index]['answers'].length, (i) => Colors.blue);
      buttonsDisabled = false;
    }
  }

  void checkAnswer(int i) {
    if (buttonsDisabled) return;

    setState(() {
      buttonsDisabled = true;
      bool isCorrect = questions[index]['answers'][i]['isCorrect'];
      buttonColors[i] = isCorrect ? Colors.green : Colors.red;

      if (!isCorrect) {
        wrongAnsw++;
        // Marcar la respuesta correcta en verde
        for (int j = 0; j < questions[index]['answers'].length; j++) {
          if (questions[index]['answers'][j]['isCorrect']) {
            buttonColors[j] = Colors.green;
          }
        }
      } else {
        results++;
      }
    });
  }

  void nextQuestion() {
    if (index + 1 == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestResultsScreen(
            correctAnswers: results,
            wrongAnswers: wrongAnsw,
            totalQuestions: 10,
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
      child: questions.isEmpty
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Text("${index + 1} /10"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        questions[index]["questions"][0]["content"]["es"],
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
                          questions[index]['answers'].length,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ElevatedButton(
                              onPressed:
                                  buttonsDisabled ? null : () => checkAnswer(i),
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(buttonColors[i]),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                padding: WidgetStateProperty.all(
                                    const EdgeInsets.all(10)),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text(
                                questions[index]['answers'][i]['content']['es'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
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
                              buttonsDisabled
                                  ? Colors.blue
                                  : Colors.grey), // Activo después de responder
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
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
