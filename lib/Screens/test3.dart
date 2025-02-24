import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/Screens/results.dart';
import 'package:trivia_app/models/questions.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Test")),
        body:
            Consumer<QuestionsModel>(builder: (context, questionsModel, child) {
          if (questionsModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Question(questions: questionsModel.questions, testName: questionsModel.jsonFile);
        }));
  }
}

class Question extends StatefulWidget {
  final List<QuestionItem> questions;
  final String testName;
  const Question({super.key, required this.questions, required this.testName });

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int index = 0;
  int results = 0;
  int wrongAnsw = 0;
  List<QuestionItem> questions = [];
  List<Color> buttonColors = [];
  bool buttonsDisabled = false;
  final String name = "test_1";

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    _initializeAnswerColors();
  }

  void _initializeAnswerColors() {
    if (questions.isNotEmpty) {
      buttonColors =
          List.generate(questions[index].answers.length, (i) => Colors.blue);
      buttonsDisabled = false;
    }
  }

  void checkAnswer(int i) {
    if (buttonsDisabled) return;
    final increaseScore =
        Provider.of<QuestionsModel>(context, listen: false).increaseScore;
    setState(() {
      buttonsDisabled = true;
      bool isCorrect = questions[index].correctAnswerIndex == i;
      buttonColors[i] = isCorrect ? Colors.green : Colors.red;

      if (!isCorrect) {
        wrongAnsw++;
        // Marcar la respuesta correcta en verde
        buttonColors[questions[index].correctAnswerIndex];
      } else {
        increaseScore();
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
      child: questions.isEmpty
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Text("${index + 1} /${questions.length}"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        questions[index].text,
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
                          questions[index].answers.length,
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
                                questions[index].answers[i],
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
