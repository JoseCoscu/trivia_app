
import 'package:flutter_bloc/flutter_bloc.dart';

class TestResultsCubit extends Cubit<TestResultsState> {
  TestResultsCubit() : super(TestResultsInitial());

  void saveResults(String testName, int correctAnswers) {
    emit(TestResultsSaved(testName, correctAnswers));
  }
}

// Estados del BLoC
abstract class TestResultsState {}

class TestResultsInitial extends TestResultsState {}

class TestResultsSaved extends TestResultsState {
  final String testName;
  final int correctAnswers;

  TestResultsSaved(this.testName, this.correctAnswers);
}
