import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/database/todo_table.dart';

class TodoDataBase{
  static const String DB_NAME ="todo.db";
  static const DB_VERSION = 1;
  static Future<Database> _database;
  static TodoDataBase instance = new TodoDataBase();
  TodoDataBase todoDataBase(){
   if(instance == null){
     instance = new TodoDataBase();
   }
  }

  Future<Database> get database => _database;

  static const initScript= [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScript= [TodoTable.CREATE_TABLE_QUERY];
  init() async{
     _database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), DB_NAME),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}