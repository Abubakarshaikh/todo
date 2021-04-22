import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

final _firestore = FirebaseFirestore.instance;
void main() async {
  runApp(
    MaterialApp(
        home: Scaffold(
      body: Center(
        child: Text('Hello, world'),
      ),
    )),
  );
  getData();
}

Future<DocumentSnapshot> getData() async {
  await Firebase.initializeApp();
  return await FirebaseFirestore.instance
      .collection("tasks")
      .doc("docID")
      .get();
}
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
