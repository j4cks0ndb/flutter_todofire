const String todosQuery = ''' 
subscription MyQuery {
  todo(order_by: {id: asc}) {
    check
    id
    title
  }
}
''';

const String  todoInsertQuery = '''
mutation InsertTodo(\$title: String) {
  insert_todo(objects: {check: false, title: \$title}) {
    returning {
      id
    }
  }
} 
''';

const String todoUpdateQuery = ''' 
mutation UpdateTodo(\$id: Int, \$title: String, \$check: Boolean) {
  update_todo(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String todoDeleteQuery = ''' 
mutation DeleteTodo(\$id: Int) {
  delete_todo(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';