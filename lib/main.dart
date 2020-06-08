import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/database/todo_database.dart';
import 'package:todolist/database/todo_table.dart';
import 'package:todolist/todo/todo_container.dart';

import 'bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDataBase.instance.init();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: Mytodo()
      ),
    );
  }
}


//class MyApp extends StatefulWidgetWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: Provider<TodoBloc>.value(
//        value: TodoBloc(),
//          child: Mytodo()
//      ),
//    );
//  }
//}

