import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<TaskController>().query(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List list = [];
          list.addAll(snapshot.data);
          return ListTaskView(taskList: list);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class ListTaskView extends StatelessWidget {
  ListTaskView({this.taskList});
  final List taskList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: taskList[index]['title'],
          value: taskList[index]['isdone'],
          id: taskList[index]['id'],
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  TaskTile({this.title, this.value, this.id});
  final String title;
  final int value;
  final int id;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title'),
      trailing: TaskChecked(currentPosition: value, id: id),
      onLongPress: () {
        context.read<TaskController>().delete(id);
      },
    );
  }
}

class TaskChecked extends StatelessWidget {
  TaskChecked({this.currentPosition, this.id});
  final int currentPosition;
  final int id;
  @override
  Widget build(BuildContext context) {
    bool isDone = false;
    if (currentPosition == 1) {
      isDone = true;
    } else {
      isDone = false;
    }
    return Checkbox(
      value: isDone,
      onChanged: (value) {
        if (value == true) {
          context.read<TaskController>().checkUpdate(id, 1);
        } else {
          context.read<TaskController>().checkUpdate(id, 0);
        }
      },
    );
  }
}
