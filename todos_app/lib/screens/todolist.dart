import 'package:flutter/material.dart';
import 'package:todos_app/model/todo.dart';
import 'package:todos_app/screens/tododetail.dart';
import 'package:todos_app/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  final String title;
  TodoList(this.title);
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  DBHelper _helper;
  List<Todo> _todos;
  int count  = 0;
  @override
  Widget build(BuildContext context) {

    if(_todos == null) {
      fetchData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              elevation: 2.0,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(_todos[position].priority.toString(),
                    style: TextStyle(
                        color: Colors.black
                    ),),
                  backgroundColor: getColor(_todos[position].priority),
                ),
                title: Text(_todos[position].title),
                subtitle: Text(_todos[position].date),
                onTap: () {
                  navigateToDetailPage(_todos[position]);
                  debugPrint(_todos[position].title);
                },
              ),
            );
          }
      ),
      floatingActionButton: RotatedBox(
        quarterTurns: 1,
        child: FloatingActionButton.extended(
          onPressed: () {
            navigateToDetailPage(Todo('','',3, ''));
          },
          icon: Icon(Icons.add),
          label: Text('Add a Todo'),
        ),
      ),
    );
  }

  Color getColor(int priority) {
    switch(priority) {
      case 1: return Colors.red;
      break;
      case 2: return Colors.yellow;
      break;
      case 3: return Colors.green;
      break;
      default: return Colors.green;
      break;
    }
  }

  void fetchData() {
    _helper = DBHelper();
    var futureDB = _helper.initializeDB();
    futureDB.then((db) {
      var futureTodos = _helper.getTodos();
      futureTodos.then((result) {
        List<Todo> todos = List<Todo>();
        for(int i = 0; i < result.length; i++) {
          todos.add(Todo.fromMap(result[i]));
        }
        setState(() {
          this._todos = todos;
          this.count = todos.length;
        });
      });
    });
  }

  void navigateToDetailPage(Todo todo) async {
    var bool = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => TodoDetail(todo),
    ));
    if(bool == true) {
      fetchData();
    }
  }
}