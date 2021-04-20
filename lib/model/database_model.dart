import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  final _databaseName = 'mydatabase4.db';
  final _databaseVersion = 1;
  Database _database;

  final table = 'demo1';
  static final columnIsDone = 'isDone';
  static final columnId = 'id';
  static final columnTitle = 'title';

  // 1. create database
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  // 2. initiazlized database
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // 3. database table
  _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnIsDone INTEGER NOT NULL,
        $columnTitle TEXT NOT NULL
      )
      ''');
  }

  // 4. CRUD: OPERATION
  Future<int> taskInsert(Map<String, Object> row) async {
    Database dbHelper = await instance.database;
    return dbHelper.insert(table, row);
  }

  Future<List<Map<String, Object>>> taskQuery() async {
    Database dbHelper = await instance.database;
    return dbHelper.query(table);
  }

  Future<int> taskUpdate(int id, Map<String, Object> row) async {
    Database dbHelper = await instance.database;
    return dbHelper.update(table, row, where: "id=?", whereArgs: [id]);
  }

  Future<int> taskDelete(int id) async {
    Database dbHelper = await instance.database;
    return dbHelper.delete(table, where: "id=?", whereArgs: [id]);
  }
}
