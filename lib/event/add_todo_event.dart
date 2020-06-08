import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';

class AddTodo extends BaseEvent{
  String _content;

  AddTodo(this._content);

  String get content => _content;

  set content(String value) {
    _content = value;
  }
}