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
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Update task',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: updateData,
            onChanged: (value) {
              title = value;
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange)),
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
