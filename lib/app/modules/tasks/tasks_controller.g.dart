// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksController on _TasksControllerBase, Store {
  final _$listAtom = Atom(name: '_TasksControllerBase.list');

  @override
  ObservableList<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$textAtom = Atom(name: '_TasksControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_TasksControllerBase._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$_TasksControllerBaseActionController =
      ActionController(name: '_TasksControllerBase');

  @override
  void setText(String newText) {
    final _$actionInfo = _$_TasksControllerBaseActionController.startAction(
        name: '_TasksControllerBase.setText');
    try {
      return super.setText(newText);
    } finally {
      _$_TasksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_TasksControllerBaseActionController.startAction(
        name: '_TasksControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_TasksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index) {
    final _$actionInfo = _$_TasksControllerBaseActionController.startAction(
        name: '_TasksControllerBase.remove');
    try {
      return super.remove(index);
    } finally {
      _$_TasksControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
text: ${text}
    ''';
  }
}
