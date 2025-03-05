import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/screens/history.dart';
import 'package:trivia_app/screens/questions.dart';
import 'package:trivia_app/screens/test3.dart';
// Asegúrate de que la ruta sea la correcta donde defines TestCubit y QuestionsCubit
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
  // Obtén el archivo JSON aleatorio antes de iniciar la app
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

/// La HomePage es Stateless ya que la inicialización se hace en el Cubit
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => const TestScreen()),
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
                  MaterialPageRoute(builder: (context) =>  const Questions()),
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
                  MaterialPageRoute(builder: (context) => const TestHistoryScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
