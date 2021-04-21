import 'package:flutter/cupertino.dart';
import 'package:todo/model/task_model.dart';

class TaskController extends ChangeNotifier {
  final DatabaseTaskModel databaseHelper = DatabaseTaskModel.instance;

  Future insert(String title) async {
    var data = await databaseHelper.taskInsert({
      DatabaseTaskModel.columnTitle: title,
      DatabaseTaskModel.columnIsDone: 0,
    });
    print(data);
    notifyListeners();
  }

  Future<List<Map<String, Object>>> query() async {
    var data = await databaseHelper.taskQuery();
    notifyListeners();
    return data;
  }

  Future update(String title, int id) async {
    var data = await databaseHelper.taskUpdate({
      DatabaseTaskModel.columnTitle: title,
      DatabaseTaskModel.columnIsDone: 0,
    }, id);
    print(data);
    notifyListeners();
  }

  Future checkUpdate(int id, int value) async {
    var data = await databaseHelper
        .taskUpdate({DatabaseTaskModel.columnIsDone: value}, id);
    print(data);
  }

  Future delete(int id) async {
    var data = await databaseHelper.taskDelete(id);
    print(data);
    notifyListeners();
  }
}
