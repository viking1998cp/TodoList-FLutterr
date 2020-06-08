import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/database/todo_database.dart';
import 'package:todolist/model/todo.dart';

class TodoTable{
  static const TABLE_NAME = 'todo';
  static const CREATE_TABLE_QUERY ='''
  CREATE TABLE  $TABLE_NAME (
  id INTEGER PRIMARY KEY,
  content TEXT
  );
  ''';

  static const DROP_TABLE_QUERY ='''
  DROP TANLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTodo (Todo todo) async {
    final Database db = await  TodoDataBase.instance.database;
    return db.insert(TABLE_NAME, todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> deleteTodo (Todo todo) async {
    final Database db = await TodoDataBase.instance.database;
    return db.delete(TABLE_NAME,
      where: 'id=?',
      whereArgs:[todo.id] );
  }

  Future<List<Todo>> selectAllTodo() async{
    final Database db = await TodoDataBase.instance.database;
    final List<Map<String , dynamic>> maps =  await db.query(TABLE_NAME);
    return List.generate(maps.length, (index) {
      return Todo.fromData(maps[index]['id'], maps[index]['content']);
    });
  }
}