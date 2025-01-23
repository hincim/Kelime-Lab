import 'dart:math';

import 'package:flutter/material.dart';
import '../db/WordDAO.dart';
import '../model/Word.dart';

class WordController with ChangeNotifier {
  final WordDAO _wordDAO = WordDAO();
  List<Word> _words = [];
  List<Word> _askedWords = []; // Sorulmuş kelimeler
  Word _correctWord = Word(english: '', turkish: '');
  List<Word> options = [];

  bool wordLoading = true;

  List<Word> get words => _words;
  Word get correctWord => _correctWord;


  Future<void> fetchWords() async {
    notifyListeners();
    try {
      _words = await _wordDAO.getAllWords();
      _askedWords.clear(); // Kelime listesini sıfırlarken sorulmuş kelimeleri de temizle
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching words: $e');
    }
    wordLoading = false;
    notifyListeners();
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

  Future<void> fetchRandomWords() async {
    try {
      List<Word> remainingWords = _words.where((word) => !_askedWords.contains(word)).toList();

      if (remainingWords.isEmpty) {
        _askedWords.clear();
        remainingWords = List.from(_words);
      }

      _correctWord = remainingWords[Random().nextInt(remainingWords.length)];
      _askedWords.add(_correctWord);

      options = await _wordDAO.getRandomOptionsWords(_correctWord.id!);
      options.add(_correctWord);
      options.shuffle();

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching random words: $e');
    }
  }
}
