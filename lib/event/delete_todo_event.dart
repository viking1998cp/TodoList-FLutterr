import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';
import 'package:todolist/model/todo.dart';

class DeleteTodo extends BaseEvent{
  Todo _todo;


  DeleteTodo(this._todo);

  Todo get todo => _todo;

  set todo(Todo value) {
    _todo = value;
  }
}
