import 'dart:math';

import 'package:flutter/material.dart';
import '../db/WordDAO.dart';
import '../model/Word.dart';

class WordController with ChangeNotifier {
  final WordDAO _wordDAO = WordDAO();
  List<Word> _randomWord = [];
  List<Word> _words = [];
  List<Word> _options = [];


  List<Word> get words => _words;
  List<Word> get randomWord => _randomWord;
  List<Word> get options => _options;

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
      await fetchWords(); // Listeyi yenile
    } catch (e) {
      debugPrint('Error adding word: $e');
    }
  }

  Future<void> deleteWord(int id) async {
    try {
      await _wordDAO.deleteWord(id);
      await fetchWords(); // Listeyi yenile
    } catch (e) {
      debugPrint('Error deleting word: $e');
    }
  }

  Future<void> deleteAllWords() async {
    try {
      await _wordDAO.deleteAllWords();
      await fetchWords(); // Listeyi yenile
    } catch (e) {
      debugPrint('Error deleting all words: $e');
    }
  }

  Future<void> getRandomWord() async {
    try {
      _randomWord = await _wordDAO.getRandomWords();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching random words: $e');
    }
  }

  Future<void> getRandomOptionsWords(int id) async {
    try {
      _options = await _wordDAO.getRandomOptionsWords(id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching random options words: $e');
    }
  }
}


