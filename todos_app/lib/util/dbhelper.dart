import 'package:async/async.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todos_app/model/todo.dart';

class DBHelper {
  String tableName = 'todos';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  static final DBHelper _dbHelper = DBHelper._internal();

  factory DBHelper() {
    return _dbHelper;
  }

  DBHelper._internal();

  static Database _db;

  Future<Database> get db async {
    if(_db == null) {
      _db = await initializeDB();
    }
    return _db;
  }

  void _onCreateDB(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableName($colId INTEGER PRIMARY KEY, $colTitle TEXT, " +
            "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)"
    );
  }

  Future<Database> initializeDB() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _onCreateDB);
    return dbTodos;
  }

  Future<int> insertTodo(Todo todo) async{
    Database db = await this.db;
    var result = db.insert(tableName, todo.toMap());
    return result;
  }

  Future<List> getTodos() async{
    Database db = await this.db;
    var result = await db.rawQuery('SELECT * FROM $tableName ORDER BY $colPriority ASC');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue( await db.rawQuery("SELECT COUNT(*) FROM $tableName"));
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = db.update(tableName, todo.toMap(),
    where: '$colId = ?', whereArgs: [todo.id]);

    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = db.delete(tableName, where: '$colId = ?', whereArgs: [id]);

    return result;
  }
}