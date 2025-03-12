


import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<Map<String, int>> {
  TestCubit() : super({});

  Map<String, int> get res => state;

  int? getResult({required String key}) {
    return state[key];
  }

  void add({required String key, required int value}) {
    final updatedResults = Map<String, int>.from(state);
    updatedResults[key] = value;
    emit(updatedResults);
  }
}