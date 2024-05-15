import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;

  const HomeScreen({super.key, required this.isDarkMode});

  onNewTodo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !isDarkMode ? Colors.white : Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: GestureDetector(
              onTap: onNewTodo(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                color: const Color.fromARGB(255, 22, 22, 22),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                "메모 탭하여 중요도 변경",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "빈 영역 눌러 새로운 메모",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                "메모 길게 눌러 추가 메뉴",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "길게 누른 후 아래로 당겨 완료",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "왼쪽 하단 버튼 눌러 세팅",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 160, 160, 160),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: const Text(
                                "하단 바 영역 눌러 완료한 메모 보기",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                            child: const Text(
                              "메모 길게 눌러 추가 메뉴",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 160, 160, 160),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: const Text(
                              "|",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 160, 160, 160),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: const Text(
                              "동생 생일 선물",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 160, 160, 160),
                              ),
                            ),
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
