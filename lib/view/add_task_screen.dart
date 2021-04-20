import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrange,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTaskBottemSheet();
            });
      },
    );
  }
}

class AddTaskBottemSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title;
    int isDone = 0;
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add task', textAlign: TextAlign.center),
          TextField(
            onChanged: (value) {
              title = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TaskController>(context, listen: false)
                  .insert(isDone, title);
            },
            child: Text('Add'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            ),
          ),
        ],
      ),
    );
  }
}
