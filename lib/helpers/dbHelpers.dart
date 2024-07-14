import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBHelper {
  static Database? _db;
  static const String tableName = 'favorites';
  static const String columnID = 'id';

  DBHelper._();
  static final DBHelper instance = DBHelper._();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'favorites.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
      $columnID INTEGER PRIMARY KEY,
      'name' TEXT,
      'image' TEXT,
      'cookingTime' INTEGER
    )
  ''');
  }

  Future<int> insertFavorite(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<int> deleteFavorite(int recipeId) async {
    Database db = await instance.database;
    return await db.delete(
      tableName,
      where: '$columnID = ?',
      whereArgs: [recipeId],
    );
  }

  Future<bool> isRecipeFavorite(int recipeId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: '$columnID = ?',
      whereArgs: [recipeId],
    );
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }
}
