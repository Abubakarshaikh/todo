import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo/controller/task_controller.dart';
import 'package:todo/model/task_model.dart';

TaskModel firebaseHelper = TaskModel.instance;

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseHelper.tasksQuery(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List list = [];
          list.addAll(snapshot.data);
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${list[index]}"),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
