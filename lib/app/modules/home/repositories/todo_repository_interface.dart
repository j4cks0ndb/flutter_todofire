import 'package:todofire/app/modules/home/models/todo_model.dart';

abstract class ITodorepository{
  Stream<List<TodoModel>> getTodos();
  
}