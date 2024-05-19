import 'package:flutter/material.dart';
import 'package:monthtodo/widgets/todo-space-widget.dart';
import 'package:monthtodo/widgets/todo-widget.dart';
import 'package:monthtodo/models/todo-model.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;

  const HomeScreen({super.key, required this.isDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _isShowTodoOptionWidget = false;
  late List<TodoModel> _todoItems;
  late List<TodoModel> _disableTodoItems;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  late int _selectedItemIndex = -1;

  void handleFocusChange() {
    if (_focusNode.hasFocus) {
      print('##### focus on #####');
    } else {
      print('##### focus off #####');
    }
  }

  onPressedBackground() {
    if (_isShowTodoOptionWidget) {
      onTodoLongPressCallback(-1);
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  void addItem(bool isEnable, TodoModel item) {
    setState(() {
      if (isEnable) {
        _todoItems.insert(0, item);
      } else {
        _disableTodoItems.insert(0, item);
      }
    });
  }

  void removeItem(bool isEnable, int index) {
    setState(() {
      if (isEnable) {
        _todoItems.removeAt(index);
      } else {
        _disableTodoItems.removeAt(index);
      }
    });
  }

  void modifyItem(String text) {
    setState(() {
      var item = _todoItems[_selectedItemIndex];
      item.setText(text);
    });
  }

  onTodoTabCallback(int index) {
    setState(() {
      var item = _todoItems[index];
      switch (item.state) {
        case TodoState.red:
          item.state = TodoState.white;
          break;
        case TodoState.blue:
          item.state = TodoState.red;
          break;
        case TodoState.white:
          item.state = TodoState.blue;
          break;
        default:
          break;
      }
    });
  }

  onTodoLongPressCallback(int index) {
    setState(() {
      if (index >= 0) {
        _isShowTodoOptionWidget = true;
        _selectedItemIndex = index;
      } else {
        _isShowTodoOptionWidget = false;
        _selectedItemIndex = -1;
      }
    });
  }

  onPressedModify() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  onPressedDelete() {
    setState(() {
      removeItem(true, _selectedItemIndex);
    });
  }

  onPressedArchive() {
    var item = _todoItems[_selectedItemIndex];
    addItem(false, item);
    removeItem(true, _selectedItemIndex);
    onTodoLongPressCallback(-1);
  }

  onPressedRestore() {
    var item = _disableTodoItems[_selectedItemIndex];
    addItem(true, item);
    removeItem(false, _selectedItemIndex);
    onTodoLongPressCallback(-1);
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() => handleFocusChange);

    _todoItems = <TodoModel>[];
    _disableTodoItems = <TodoModel>[];

    _todoItems.add(TodoModel(text: "메모 탭하여 중요도 변경", state: TodoState.blue));
    _todoItems.add(TodoModel(text: "빈 영역 눌러 새로운 메모", state: TodoState.red));
    _todoItems.add(TodoModel(text: "메모 길게 눌러 추가 메뉴", state: TodoState.white));
    _todoItems
        .add(TodoModel(text: "길게 누른 후 아래로 당겨 완료", state: TodoState.white));
    _todoItems.add(TodoModel(text: "왼쪽 하단 버튼 눌러 세팅", state: TodoState.white));
    _todoItems
        .add(TodoModel(text: "하단 바 영역 눌러 완료한 메모 보기", state: TodoState.white));

    _disableTodoItems
        .add(TodoModel(text: "메모 길게 눌러 추가 메뉴", state: TodoState.black));
    _disableTodoItems.add(TodoModel(text: "동생 생일 선물", state: TodoState.black));
  }

  @override
  void dispose() {
    // 포커스 노드 및 리스너 제거
    _focusNode.removeListener(handleFocusChange);
    _focusNode.dispose();

    _todoItems.clear();
    _disableTodoItems.clear();

    super.dispose();
  }

  ListView makeList(List<TodoModel> list) {
    return ListView.builder(
      shrinkWrap: true, // 리스트 자식 높이 크기의 합 만큼으로 영역 고정
      physics: const NeverScrollableScrollPhysics(), // 스크롤 안되도록 설정하는 옵션 값
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        var todoItem = list[index];
        return Row(
          children: [
            Todo(
              text: todoItem.text,
              state: todoItem.state,
              onTabCallback: () => onTodoTabCallback(index),
              onLongPressCallback: () => onTodoLongPressCallback(index),
            ),
            if (list.length > 1 && index != (list.length - 1)) TodoSpace(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !widget.isDarkMode ? Colors.white : Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: GestureDetector(
              onTap: onPressedBackground,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                color: const Color.fromARGB(255, 22, 22, 22),
                //child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      focusNode: _focusNode,
                      controller: _textController,
                      onSubmitted: (value) {
                        if (value != "") {
                          if (_selectedItemIndex >= 0) {
                            modifyItem(value);
                          } else {
                            addItem(
                              true,
                              TodoModel(text: value, state: TodoState.white),
                            );
                          }
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 40,
                      child: makeList(_todoItems),
                    ),
                  ],
                ),
                //),
              ),
            ),
          ),
          if (_isShowTodoOptionWidget)
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: const Color.fromARGB(255, 22, 22, 22),
                child: Row(
                  children: [
                    OutlinedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: onPressedModify,
                      child: const Text("Modify"),
                    ),
                    OutlinedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: onPressedDelete,
                      child: const Text("Delete"),
                    ),
                    OutlinedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: onPressedArchive,
                      child: const Text("Archive"),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 30,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 40,
                            child: makeList(_disableTodoItems),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
