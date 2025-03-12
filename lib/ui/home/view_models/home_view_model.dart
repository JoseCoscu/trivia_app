import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<String?> {
  LanguageCubit() : super(null);

  void setLanguage(String language) {
    emit(language);
  }
}
