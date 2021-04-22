// import 'package:flutter/widgets.dart';
// import 'package:todo/model/task_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TaskController extends ChangeNotifier {
//   TaskModel firebaseHelper = TaskModel.instance;

//   // Future insert(String title, bool isdone) async {
//   //   var data = await firebaseHelper.tasksInsert({
//   //     'title': title,
//   //     'isdone': isdone,
//   //   });
//   //   notifyListeners();
//   //   return data;
//   // }

//   Future<QuerySnapshot> query() async {
//     var data = await firebaseHelper.tasksQuery();
//     notifyListeners();
//     return data;
//   }

//   // Future<void> update(String id, String title, bool isdone) async {
//   //   var data = await firebaseHelper.tasksUpdate(id, {
//   //     'title': title,
//   //     'idone': isdone,
//   //   });
//   //   notifyListeners();
//   //   return data;
//   // }

//   // Future<void> delete(String id) async {
//   //   var data = await firebaseHelper.tasksDelete(id);
//   //   notifyListeners();
//   //   return data;
//   // }
// }
