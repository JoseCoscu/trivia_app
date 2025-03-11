
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/cubic_question.dart';
import 'package:trivia_app/ui/home/widgets/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider<TestCubit>(
          create: (context) => TestCubit(),
        ),
        BlocProvider<ApiCubit>(
          create: (context) => ApiCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<QuestionsCubit>(
          create: (context) => QuestionsCubit()),
        
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

