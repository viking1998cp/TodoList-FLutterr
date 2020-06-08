import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/todo/todo_header.dart';
import 'package:todolist/todo/todo_list.dart';

class Mytodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo")),
        ),
        body: Column(
          children: <Widget>[
            MyHeader(),
            Expanded(child: MyTodoList())
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}