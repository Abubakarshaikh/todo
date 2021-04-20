import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';
import 'package:todo/view/update_screen.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TaskController>(context).query(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TaskList(taskSnapshot: snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({this.taskSnapshot});
  final List taskSnapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskSnapshot.length,
      itemBuilder: (context, index) {
        int id = taskSnapshot[index]['id'];
        int isCheck = taskSnapshot[index]['isDone'];
        String updateTitle = taskSnapshot[index]['title'];
        return ListTile(
          title: Text('${taskSnapshot[index]['title']}'),
          trailing: TaskChecked(id: id, isDone: isCheck),
          onLongPress: () {
            Provider.of<TaskController>(context, listen: false).delete(id);
          },
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return UpdateScreen(updateScreen: updateTitle, id: id);
                });
          },
        );
      },
    );
  }
}

class TaskChecked extends StatelessWidget {
  TaskChecked({this.id, this.isDone});
  final id;
  final isDone;
  @override
  Widget build(BuildContext context) {
    bool isCheck = isDone == 1 ? true : false;
    return Checkbox(
      value: isCheck,
      onChanged: (value) {
        if (value == false) {
          Provider.of<TaskController>(context, listen: false).update(id, 0);
        } else {
          Provider.of<TaskController>(context, listen: false).update(id, 1);
        }
      },
    );
  }
}
