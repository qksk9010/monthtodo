import 'package:flutter/material.dart';

class TodoSpace extends StatelessWidget {
  TodoSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: const Text(
        "|",
        style: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 160, 160, 160),
        ),
      ),
    );
  }
}
