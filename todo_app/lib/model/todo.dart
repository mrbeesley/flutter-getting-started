class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // Constructor shortcut!
  Todo(this._title, this._priority, this._date, [this._description]);
  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);
  Todo.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._date = o["date"];
    this._priority = o["priority"];
  }

  // Getters for internal values
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // Setters for internal values
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 500) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  // Utility Methods for Class
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }
}
