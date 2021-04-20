import 'package:flutter/material.dart';
import 'package:todo/model/database_model.dart';

class TaskController extends ChangeNotifier {
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  insert(int isDone, String title) async {
    final data = await _databaseHelper.taskInsert({
      DatabaseHelper.columnIsDone: isDone,
      DatabaseHelper.columnTitle: title,
    });
    print(data);
    notifyListeners();
  }

  query() async {
    final data = await _databaseHelper.taskQuery();
    notifyListeners();
    return data;
  }

  update(int id, int isDone) async {
    final data = await _databaseHelper.taskUpdate(id, {
      DatabaseHelper.columnIsDone: isDone,
    });
    print(data);
    notifyListeners();
  }

  updateTask(int id, String title) async {
    final data = await _databaseHelper.taskUpdate(id, {
      DatabaseHelper.columnTitle: title,
    });
    print(data);
    notifyListeners();
  }

  delete(int id) async {
    final data = await _databaseHelper.taskDelete(id);
    print(data);
    notifyListeners();
  }
}
