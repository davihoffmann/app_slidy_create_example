import 'package:app_slidy_create/app/modules/tasks/tasks_controller.dart';
import 'package:app_slidy_create/app/modules/tasks/tasks_module.dart';
import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_mock.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(
    TasksModule(),
    changeBinds: [
      Bind<ILocalStorage>((i) => LocalStorageMock()),
    ],
  );

  test('Click Save', () async {
    final TasksController controller = Modular.get();
    controller.text = 'davi';
    controller.save();
    expect(controller.list.length, 1);
    expect(controller.list[0], 'davi');
    // List<String> listLocalStorage = await Modular.get<ILocalStorage>().get('key');
    // expect(listLocalStorage[0], 'davi');
  });

  test('Click Remove', () async {
    final TasksController controller = Modular.get();
    controller.text = 'davi';
    controller.save();
    controller.remove(0);
    expect(controller.list.length, 0);
    expect(controller.list.isEmpty, true);
  });
}
