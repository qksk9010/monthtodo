import 'package:flutter/material.dart';
import 'package:monthtodo/models/todo-model.dart';

class Todo extends StatefulWidget {
  final VoidCallback onTabCallback;
  final VoidCallback onLongPressCallback;
  late String text;
  late TodoState state;

  Todo({
    Key? key,
    required this.text,
    required this.state,
    required this.onTabCallback,
    required this.onLongPressCallback,
  }) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Color GetColorFromState() {
    switch (widget.state) {
      case TodoState.red:
        return Colors.red;
      case TodoState.blue:
        return Colors.blue;
      case TodoState.white:
        return Colors.white;
      default:
        return const Color.fromARGB(255, 160, 160, 160);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTabCallback,
      onLongPress: widget.onLongPressCallback,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 15,
          color: GetColorFromState(),
        ),
      ),
    );
  }
}
