import 'package:app_slidy_create/app/modules/tasks/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskTile extends StatelessWidget {
  final int index;

  TaskTile({this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<TasksController>();

    return ListTile(
      title: Text(controller.list[index]),
      trailing: IconButton(
        icon: Icon(Icons.cancel, color: Colors.red),
        onPressed: () => controller.remove(index),
      ),
    );
  }
}
