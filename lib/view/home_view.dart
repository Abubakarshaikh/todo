import 'package:flutter/material.dart';
import 'package:todo/view/add_task_view.dart';
import 'package:todo/view/task_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Todo'),
      ),
      body: TaskView(),
      floatingActionButton: AddTaskView(),
    );
  }
}
