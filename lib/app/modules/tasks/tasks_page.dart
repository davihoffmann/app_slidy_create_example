import 'package:app_slidy_create/app/modules/tasks/widgets/task_tile.dart';
import 'package:app_slidy_create/app/shared/auth/auth_controller.dart';
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
  final _authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            await _authController.logout();
            Modular.to.pushReplacementNamed('/login');
          },
        ),
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
