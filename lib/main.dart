import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:trivia_app/models/questions.dart';
import 'package:trivia_app/screens/history.dart';
import 'package:trivia_app/screens/questions.dart';
import 'package:trivia_app/screens/test3.dart';

Future<String> getRandomJsonFile() async {
  try {
    // Lista de archivos JSON según pubspec.yaml
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

    // Seleccionar un archivo aleatorio
    final random = Random();
    String selectedFile = jsonFiles[random.nextInt(jsonFiles.length)];
    print("Archivo JSON seleccionado: $selectedFile");
    return selectedFile;
  } catch (e) {
    print("Error al seleccionar un archivo JSON: $e");
    return "assets/default.json"; // Archivo de respaldo si ocurre un error
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionsModel(jsonFile: "assets/default.json")),
        ChangeNotifierProvider(create: (context) => TestModel()),
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? randomJson;

  @override
  void initState() {
    super.initState();
    _loadRandomJson();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadRandomJson();
  }

  Future<void> _loadRandomJson() async {
    String newJson = await getRandomJsonFile();
    if (mounted) {
      setState(() {
        randomJson = newJson;
      });
      // Actualizar el modelo con el nuevo JSON
      Provider.of<QuestionsModel>(context, listen: false).updateJsonFile(newJson);
    }
  }

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
                  MaterialPageRoute(builder: (context) => const Test()),
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
                  MaterialPageRoute(builder: (context) => const Questions()),
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
