import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TranslateController {
  static String API_KEY = dotenv.env['API_KEY'] ?? '';
  static String BASE_URL = dotenv.env['BASE_URL'] ?? '';
  static Future<List<String>> getTurkishTranslations(String word, String translate) async {
    final dio = Dio();
    final response = await dio.get(
      BASE_URL,
      queryParameters: {
        'key': API_KEY,
        'lang': translate,
        'text': word,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final definitions = data['def'] as List;

      List<String> turkishTranslations = [];
      for (var definition in definitions) {
        final translations = definition['tr'] as List;
        for (var translation in translations) {
          turkishTranslations.add(translation['text']);
        }
      }
      return turkishTranslations;
    } else {
      throw Exception('Failed to fetch translations');
    }
  }
}