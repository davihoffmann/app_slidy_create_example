import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_shared_preferences.dart';

import 'tasks_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tasks_page.dart';

class TasksModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TasksController()),
        // Bind((i) => LocalStorageHive()),
        Bind((i) => LocalStorageSharedPreferences()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TasksPage()),
      ];

  static Inject get to => Inject<TasksModule>.of();
}
