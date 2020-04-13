import 'package:hasura_connect/hasura_connect.dart';
import 'package:todofire/app/modules/home/documents/todo_documents.dart';
import 'package:todofire/app/modules/home/models/todo_model.dart';
import 'package:todofire/app/modules/home/repositories/todo_repository_interface.dart';

class TodoHasuraRepository implements ITodorepository{

  final HasuraConnect connect;

  TodoHasuraRepository(this.connect);

  @override
  Future delete(TodoModel model) {
    connect.mutation(todoDeleteQuery, variables: {'id':model.id});
  }

  @override
  Stream<List<TodoModel>> getTodos() {    
    print('test');
    return connect.subscription(todosQuery).map((event){
      print('teste');
      print(event);
      return (event['data']['todo'] as List).map((json){
        print(json);
        return TodoModel.fromJson(json);
      }).toList();
    });
  }

  @override
  Future save(TodoModel model) async {
    if (model.id ==null){
      var data = await connect.mutation(todoInsertQuery, variables: {
        'title': model.title 
      });
      model.id = data ['data']['insert_todo']['returning'][0]['id'];
    }else{
      connect.mutation(todoUpdateQuery, variables: {
        'id': model.id,
        'title': model.title,
        'check': model.check
      });
    }
  }

}