import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseTaskModel {
  DatabaseTaskModel._privateConstructor();
  static final DatabaseTaskModel instance =
      DatabaseTaskModel._privateConstructor();
  Database _database;
  final _databaseName = 'mydatabase5.db';
  final _databaseVersion = 1;
  final table = 'demo3';

  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnIsDone = 'isdone';

  // 1. create database
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  // 2. initialized database
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // 3. create database tables ..
  _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnIsDone INTEGER NOT NULL
      )
      ''');
  }

  // 4. CRUD operations

  Future<int> taskInsert(Map<String, Object> row) async {
    Database dbHelper = await instance.database;
    return dbHelper.insert(table, row);
  }

  Future<List<Map<String, Object>>> taskQuery() async {
    Database dbHelper = await instance.database;
    return dbHelper.query(table);
  }

  Future<int> taskUpdate(Map<String, Object> row, int id) async {
    Database dbHelper = await instance.database;
    return dbHelper.update(table, row, where: "id=?", whereArgs: [id]);
  }

  Future<int> taskDelete(int id) async {
    Database dbHelper = await instance.database;
    return dbHelper.delete(table, where: "id=?", whereArgs: [id]);
  }
}
