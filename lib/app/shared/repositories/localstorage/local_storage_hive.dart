import 'dart:async';

import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instace = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    var box = await Hive.openBox('db');
    _instace.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instace.future;

    box.delete(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var box = await _instace.future;

    return box.get(key);
  }

  @override
  Future put(String key, List<String> value) async {
    var box = await _instace.future;

    box.put(key, value);
  }
  
}
