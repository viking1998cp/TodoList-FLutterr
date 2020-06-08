import 'dart:async';
import 'dart:math';

import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';
import 'package:todolist/database/todo_table.dart';
import 'package:todolist/event/add_todo_event.dart';
import 'package:todolist/event/delete_todo_event.dart';
import '../model/todo.dart';
class TodoBloc extends BaseBloc{
  StreamController<List<Todo>> _todoStreamController = StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoStreamController.stream;

  TodoTable _todoTable =new TodoTable();
  List<Todo> todoListData = new List<Todo>();

  initData() async {
    todoListData = await _todoTable.selectAllTodo();
    print("data: "+todoListData.length.toString());
    _todoStreamController.sink.add(todoListData);
  }

  _addTodo(Todo todo) async {
    await _todoTable.insertTodo(todo);
    todoListData.add(todo);
    _todoStreamController.sink.add(todoListData);
  }

  _deleteTodo(Todo todo) async {
    todoListData.remove(todo);
    await _todoTable.deleteTodo(todo);
    _todoStreamController.sink.add(todoListData);
  }

  var _random = Random();
  @override
  void dispatchEvent(BaseEvent event) {
    if(event is AddTodo){
      Todo todo = Todo.fromData(_random.nextInt(1000000), event.content);
      _addTodo(todo);
        print(event.content);
    }else if(event is DeleteTodo){
      Todo todo = event.todo;
      _deleteTodo(todo);
    }
  }
  @override
  void dispose() {
    super.dispose();
  }

}