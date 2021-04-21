import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
