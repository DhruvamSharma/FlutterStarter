class Todo {
  int _id;
  String _title;
  String _date;
  String _description;
  int _priority;

  Todo(this._title, this._date, this._priority, [this._description]);
  //Named constructor because two constructors are not allowed.
  Todo.withId(this._id,this._title, this._date, this._priority, [this._description]);

  int get priority => _priority;

  set priority(int value) {
    if(value > 0 && value <= 3)
    _priority = value;
  }

  String get description => _description;

  set description(String value) {
    if(value.length <= 255)
    _description = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get title => _title;

  set title(String value) {
    if(value.length <= 255)
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  /// This is a utility method for the model
  /// that helps in sqflite parsing.
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;
    if(_id != null)
    map['id'] = _id;

    return map;
  }
  /// This is a utility method for the model
  /// that helps in sqflite parsing.
  Todo.fromMap(dynamic o) {
    this._id = o['id'];
    this._priority = o['priority'];
    this._description = o['description'];
    this._title = o['title'];
    this._date = o['date'];
  }
}