import 'package:mobx/mobx.dart';
import 'package:todofire/app/modules/home/repositories/todo_repository_interface.dart';

import 'models/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodorepository repository;

  @observable
  ObservableStream<List<TodoModel>> todolist;

  _HomeControllerBase(ITodorepository this.repository){
    getList();
  }

  @action
  getList(){
    todolist = repository.getTodos().asObservable();
  }

  Future save(TodoModel model) => repository.save(model);

  Future delete(TodoModel model){
    repository.delete(model);
  }


}
