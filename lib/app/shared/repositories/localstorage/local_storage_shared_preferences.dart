import 'dart:async';

import 'package:app_slidy_create/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSharedPreferences implements ILocalStorage {
  Completer<SharedPreferences> _instace = Completer<SharedPreferences>();

  _init() async {
    _instace.complete(await SharedPreferences.getInstance());
  }

  LocalStorageSharedPreferences() {
    _init();
  }

  @override
  Future delete(String key) async {
    var shared = await _instace.future;

    shared.remove(key);
  }

  @override
  Future<List<String>> get(String key) async {
    var shared = await _instace.future;

    return shared.getStringList(key);
  }

  @override
  Future put(String key, List<String> value) async {
    var shared = await _instace.future;

    shared.setStringList(key, value);
  }
}
