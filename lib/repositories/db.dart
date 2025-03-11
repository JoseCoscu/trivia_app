import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app/models/test_score_db.dart';

class Database {
  // Variable privada estática para almacenar la instancia de Isar
  static Isar? _instance;

  // Método getter para acceder a la instancia de Isar
  static Future<Isar> get instance async {
    // Si la instancia ya está abierta, simplemente la devolvemos
    if (_instance != null) return _instance!;

    // Si no está abierta, obtenemos el directorio de la aplicación
    final dir = await getApplicationDocumentsDirectory();

    // Abrimos la base de datos Isar y la almacenamos en la variable estática
    _instance = await Isar.open(
      [TestResultSchema,TestQuestionSchema,QuestionsEnglishSchema,QuestionsFrenchSchema], // Asegúrate de incluir tu modelo aquí
      directory: dir.path,
    );
    return _instance!;
  }
}
