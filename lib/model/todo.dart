class Todo {
  int _id;
  String _content;

  Todo.fromData(id, container){
    _id = id;
    _content = container;
  }

  String get container => _content;

  set container(String value) {
    _content = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap(){
    return{
      'id': _id,
      'content': _content
    };
  }
}