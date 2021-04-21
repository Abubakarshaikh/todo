import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';

class AddTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrange,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottemSheetView();
            });
      },
    );
  }
}

class BottemSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title;
    return Container(
      child: Column(
        children: [
          Text('task add'),
          TextField(
            onChanged: (value) {
              title = value;
            },
          ),
          TaskButton(
            buttonCollors: Colors.deepOrange,
            title: 'Add',
            onPressed: () {
              context.read<TaskController>().insert(title);
            },
          ),
        ],
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  TaskButton({this.buttonCollors, this.title, this.onPressed});
  final Color buttonCollors;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('$title'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonCollors),
      ),
      onPressed: onPressed,
    );
  }
}
