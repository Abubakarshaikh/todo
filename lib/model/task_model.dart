import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  TaskModel._privateConstructor();
  static final TaskModel instance = TaskModel._privateConstructor();
  final _firestore = FirebaseFirestore.instance;

  // CRUD OPERATION: insert, query, update, delete

  // // 1.
  // Future<DocumentReference> tasksInsert(Map<String, dynamic> row) async {
  //   var data = await _firestore.collection('tasks').add(row);
  //   return data;
  // }

  // 2.
  Future<QuerySnapshot> tasksQuery() async {
    var data = await _firestore.collection('tasks').get();
    return data;
  }

  // // 3.
  // Future<void> tasksUpdate(String id, Map<String, dynamic> row) async {
  //   var data = await _firestore.collection('tasks').doc(id).update(row);
  //   return data;
  // }

  // // 4.
  // Future<void> tasksDelete(String id) async {
  //   var data = await _firestore.collection('tasks').doc(id).delete();
  //   return data;
  // }
}
