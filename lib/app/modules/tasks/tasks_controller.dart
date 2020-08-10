import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'tasks_controller.g.dart';

class TasksController = _TasksControllerBase with _$TasksController;

abstract class _TasksControllerBase with Store {
  final ILocalStorage _store = Modular.get<ILocalStorage>();

  @observable
  ObservableList<String> list = <String>[].asObservable();

  @action
  _init() async {
    List<String> listLocalStorage = await _store.get('list');

    if (listLocalStorage == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocalStorage.asObservable();
    }
  }

  _TasksControllerBase() {
    _init();
  }

  @observable
  String text = '';

  @action
  void setText(String newText) {
    text = newText;
  }

  @action
  void save() {
    list.add(text);
    _store.put('list', list);
  }

  @action
  void remove(int index) {
    list.removeAt(index);
    _store.put('list', list);
  }
}
