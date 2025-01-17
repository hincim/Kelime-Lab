import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/Word.dart';

class WordDAO {
  static final WordDAO _instance = WordDAO._init();
  static Database? _database;

  WordDAO._init();

  factory WordDAO() => _instance;

  // Veritabanını başlatır
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'words.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE words (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            english TEXT NOT NULL,
            turkish TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Yeni kelime ekleme
  Future<void> addWord(Word word) async {
    try {
      final db = await database;
      await db.insert(
        'words',
        word.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Kelime eklenirken hata oluştu: $e');
    }
  }

  // Tüm kelimeleri alma
  Future<List<Word>> getAllWords() async {
    try {
      final db = await database;
      final result = await db.query('words', orderBy: 'english ASC');
      return result.map((map) => Word.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Kelimeler alınamadı: $e');
    }
  }

  Future<List<Word>> getWordBySearch(String query) async {
    try {
      final db = await database;

      // Eğer bir arama sorgusu varsa, bu sorguyu 'english' ve 'turkish' kolonlarına ekleyelim.
      final result = await db.query(
        'words',
        where: 'english LIKE ? OR turkish LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
        orderBy: 'english ASC',
      );

      return result.map((map) => Word.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Kelimeler alınamadı: $e');
    }
  }


  Future<void> deleteWord(int id) async {
    try {
      final db = await database;
      await db.delete('words', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw Exception('Kelime silinemedi: $e');
    }
  }
}

