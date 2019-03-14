import 'package:async/async.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todos_app/model/todo.dart';

class DBHelper {
  String dbName = 'todos';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  static final DBHelper _dbHelper = DBHelper();

  factory DBHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if(_db == null) {
      _db = await initializeDB();
    }

    return _db;
  }

  void _onCreateDB(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $dbName($colId INTEGER PRIMARY KEY, $colTitle TEXT, " +
            "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)"
    );
  }

  Future<Database> initializeDB() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todos.db";
    var dbTodos = openDatabase(path, version: 1, onCreate: _onCreateDB);
    return dbTodos;
  }

  Future<int> insertTodo(Todo todo) async{
    Database db = await this.db;
    var result = db.insert(dbName, todo.toMap());
    return result;
  }

  Future<List> getTodos() async{
    Database db = await this.db;
    var result = db.query(dbName);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue( await db.rawQuery("SELECT COUNT(*) FROM $dbName"));
    return result;
  }
}