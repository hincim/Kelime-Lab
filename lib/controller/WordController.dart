import 'package:flutter/material.dart';
import 'package:ilk_proje/db/WordDAO.dart';

import '../model/Word.dart';

class WordController with ChangeNotifier {
  final WordDAO _wordDAO = WordDAO();
  List<Word> _words = [];

  List<Word> get words => _words;

  Future<void> fetchWords() async {
    try {
      _words = await _wordDAO.getAllWords();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching words: $e');
    }
  }

  Future<void> fetchWordBySearch(String query) async {
    try {
      _words = await _wordDAO.getWordBySearch(query);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching words: $e');
    }
  }
  Future<void> addWord(Word word) async {
    try {
      await _wordDAO.addWord(word);
      await fetchWords(); // Refresh the list
    } catch (e) {
      debugPrint('Error adding word: $e');
    }
  }

  Future<void> deleteWord(int id) async {
    try {
      await _wordDAO.deleteWord(id);
      await fetchWords(); // Refresh the list
    } catch (e) {
      debugPrint('Error deleting word: $e');
    }
  }

  Future<void> deleteAllWords() async {
    try {
      await _wordDAO.deleteAllWords();
      await fetchWords(); // Refresh the list
    } catch (e) {
      debugPrint('Error deleting all words: $e');
    }
  }
}