import 'package:app_slidy_create/app/modules/tasks/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tasks_controller.dart';

class TasksPage extends StatefulWidget {
  final String title;
  const TasksPage({Key key, this.title = "Tasks"}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends ModularState<TasksPage, TasksController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setText,
        ),
        actions: [
          Observer(builder: (context) {
            return IconButton(
                icon: Icon(Icons.add),
                onPressed: controller.text.isEmpty ? null : controller.save);
          })
        ],
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            return TaskTile(index: index);
          },
        );
      }),
    );
  }
}
