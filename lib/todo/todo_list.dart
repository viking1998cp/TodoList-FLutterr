import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/event/delete_todo_event.dart';

import 'package:todolist/model/todo.dart';

class MyTodoList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MyTodoListState();
    throw UnimplementedError();
  }
}

class MyTodoListState extends State<MyTodoList>{

  @override
  void didChangeDependencies() {
    print("data");
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<TodoBloc>(context);

    bloc.initData();
    return Consumer<TodoBloc>(
      builder:(context, bloc, child)=> StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        builder:(context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.active:
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data[index].container),
                      trailing: GestureDetector(
                        onTap: (){
                          bloc.event.add(DeleteTodo(snapshot.data[index]));
                        },
                        child: Icon(Icons.delete, color: Colors.red[400],),
                      ),
                    );
                  }
              );
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  child: Text("Empty"),
                ),
              );
            case ConnectionState.none:
            default:
              return Center(
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  child: CircularProgressIndicator(),
                ),
              );
          }
        }
      ),
    );
    throw UnimplementedError();
  }
  
}