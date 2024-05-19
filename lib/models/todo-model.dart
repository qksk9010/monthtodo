enum TodoState {
  red,
  blue,
  white,
  black,
}

class TodoModel {
  late String text;
  late TodoState state;

  TodoModel({
    required this.text,
    required this.state,
  });

  void setText(String text) {
    this.text = text;
  }
}
