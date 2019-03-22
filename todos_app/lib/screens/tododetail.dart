import 'package:flutter/material.dart';
import 'package:todos_app/model/todo.dart';
import 'package:todos_app/util/dbhelper.dart';
import 'package:intl/intl.dart';

final List<String> choices = const <String> [
  'Save Goal and go back',
  'Delete Goal',
  'Discard Goal'
];

DBHelper _helper = DBHelper();

const saveMenu = 'Save Goal and go back';
const deleteMenu = 'Delete Goal';
const discardMenu = 'Discard Goal';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);
  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State<TodoDetail> {
  Todo todo;
  String priority = 'low';
  //TODO only static variables can be constant
  List<String> _priorities = const <String> ['low','medium','high'];
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  TodoDetailState(this.todo);
  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String> (
            onSelected: select,
            itemBuilder: (context) {
              return choices.map((data) {
                return PopupMenuItem(
                    child: Text(data),
                    value: data,
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: textStyle,
                  onChanged: (data) {
                    todo.title = titleController.text;
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (data) {
                    todo.description = descriptionController.text;
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
              ListTile(
                title: DropdownButton<String> (
                  onChanged: (String data) {
                    setState(() {
                      priority = data;
                      todo.priority = getPriority(data);
                    });
                  },
                  items: _priorities.map((String item) {
                    return DropdownMenuItem<String> (
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  value: priority,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int getPriority(String value) {
    switch (value) {
      case 'low':
        return 3;
        break;
      case 'medium':
        return 2;
        break;
      case 'high':
        return 1;
        break;
      default:
        return 3;
        break;
    }
  }

  void select(String data) {
    switch (data) {
      case saveMenu: {
      save();
      break;
      }
      case deleteMenu: {
      if(todo.id == null)
      return;
      delete();
      break;
      }
      case discardMenu: {
      Navigator.pop(context, true);
      break;
      }
      default:
      break;
    }
  }

  void save() {
    todo.date = DateFormat.yMd().format(DateTime.now());
    if(todo.id != null) {
      _helper.updateTodo(todo);
    } else {
      _helper.insertTodo(todo);
    }
    Navigator.pop(context, true);
  }

  void delete() async{
    Navigator.pop(context, true);
   var result = await _helper.deleteTodo(todo.id);
   if(result != 0) {

   }
  }
}