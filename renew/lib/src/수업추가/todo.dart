import 'package:flutter/material.dart';

// To do를 선언할 모델
class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todos = [];

  // 새로운 할 일을 추가하는 메소드
  void _addTodo() {
    String title = ""; // 새로운 할 일의 제목 초기화
    String description = ""; // 새로운 할 일의 설명 초기화
    // 다이얼로그를 보여줘서 새로운 할 일 입력을 받음
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('나의 할일'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // 컬럼의 크기를 내용 크기에 맞춤
            children: [
              // 제목을 입력받는 TextField
              TextField(
                onChanged: (value) {
                  title = value; // 제목 입력 값을 title 변수에 저장
                },
                decoration: const InputDecoration(hintText: "글 제목"),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(hintText: "글 내용"),
              ),
            ],
          ),
          actions: [
            // "추가하기" 버튼
            ElevatedButton(
              onPressed: () {
                // 제목과 설명이 비어 있지 않을 때만 추가
                if (title.isNotEmpty && description.isNotEmpty) {
                  setState(() {
                    // 새로운 Todo를 리스트에 추가
                    todos.add(Todo(
                      title: title,
                      description: description,
                    ));
                  });
                  // 다이얼로그 닫기
                  Navigator.of(context).pop();
                }
              },
              child: const Text("추가하기"),
            ),
          ],
        );
      },
    );
  }

  // 특정 할 일을 삭제하는 메소드
  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index); // 인덱스에 해당하는 할 일을 리스트에서 삭제
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" To do List "),
        actions: [
          IconButton(
            onPressed: _addTodo,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // 할 일 목록을 표시하는 ListView
      body: ListView.builder(
        itemCount: todos.length, // 리스트 항목 수
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(todos[index].title), // 할 일의 제목
            subtitle: Text(todos[index].description), // 할 일의 설명
            trailing: IconButton(
              icon: const Icon(Icons.delete), // 삭제 아이콘
              onPressed: () => _deleteTodo(index), // 누르면 해당 할 일을 삭제
            ),
          );
        },
      ),
    );
  }
}
