import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/task_controller.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({this.updateScreen, this.id});
  final updateScreen;
  final id;
  @override
  Widget build(BuildContext context) {
    TextEditingController updateData = TextEditingController();
    updateData.text = updateScreen;
    String title;
    return Container(
      child: Column(
        children: [
          TextField(
            controller: updateData,
            onChanged: (value) {
              title = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TaskController>(context, listen: false)
                  .updateTask(id, title);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
