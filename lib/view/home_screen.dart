import 'package:flutter/material.dart';
import 'package:todo/view/task_screen.dart';
import 'package:todo/view/add_task_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Todo'),
      ),
      body: TaskScreen(),
      floatingActionButton: AddTaskScreen(),
    );
  }
}
