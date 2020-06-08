
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/event/add_todo_event.dart';

class MyHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var _tvTodo =TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _tvTodo,
            decoration: InputDecoration(
              labelText: "Add todo",
              hintText: "Add todo",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: RaisedButton.icon(
              onPressed:(){
                bloc.event.add( AddTodo(_tvTodo.text));
              }
          , icon: Icon(Icons.add),
              label: Text("Add")
          )
        )
      ],
    );
    throw UnimplementedError();
  }

}