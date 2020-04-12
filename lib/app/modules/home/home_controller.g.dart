// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$todolistAtom = Atom(name: '_HomeControllerBase.todolist');

  @override
  ObservableStream<List<TodoModel>> get todolist {
    _$todolistAtom.context.enforceReadPolicy(_$todolistAtom);
    _$todolistAtom.reportObserved();
    return super.todolist;
  }

  @override
  set todolist(ObservableStream<List<TodoModel>> value) {
    _$todolistAtom.context.conditionallyRunInAction(() {
      super.todolist = value;
      _$todolistAtom.reportChanged();
    }, _$todolistAtom, name: '${_$todolistAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'todolist: ${todolist.toString()}';
    return '{$string}';
  }
}
