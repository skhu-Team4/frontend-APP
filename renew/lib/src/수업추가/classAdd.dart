import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'recommand.dart';

class SearchPotatoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 현재 경로를 가져옵니다
    final currentLocation =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    // 로그인 후 기본 경로 '/find-potatoes'가 선택된 상태로 시작
    final currentIndex = currentLocation == '/find-potatoes'
        ? 0
        : currentLocation == '/main-chatting'
            ? 1
            : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EB), // 배경 색상
      body: Stack(
        children: [
          Positioned(
            top: 65,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.go('/'); // 로그인 화면으로 돌아가기
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Center(
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/Hotpotato.png'),
                        height: 70,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '감자 찾기',
                        style: TextStyle(
                          fontFamily: 'SF함박눈',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommandPage()),
                    ); // 추천 페이지로 이동
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300), // 테두리
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          "과목명, 교수명으로 검색",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '내 강의',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    CourseTile(
                        courseName: '데이터베이스', professor: '홍은지', users: 6),
                    CourseTile(courseName: '데이터통신', professor: '유상신', users: 3),
                    CourseTile(
                        courseName: '웹프로그래밍', professor: '김선형', users: 16),
                    CourseTile(courseName: '운영체제', professor: '노은하', users: 0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 선택된 탭 설정
        onTap: (index) {
          if (index == currentIndex) return; // 현재 선택된 탭 클릭 시 아무 작업도 안 함
          switch (index) {
            case 0:
              context.go('/find-potatoes'); // 수업 추가 화면으로 이동
              break;
            case 1:
              context.go('/main-chatting'); // 채팅 화면으로 이동
              break;
            case 2:
              context.go('/my-page'); // 마이페이지로 이동
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '감자찾기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        backgroundColor: Color(0xFFFFF8EB), // 하단 바 색상
        selectedItemColor: Colors.black, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String courseName;
  final String professor;
  final int users;

  CourseTile(
      {required this.courseName, required this.professor, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300), // 강좌 테두리
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(professor),
              Text(
                '6206/월/12:00~15:00/XB00005-01', // 강좌 시간 예시
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text('$users 명 이용 중'),
              Icon(
                users > 0 ? Icons.circle : Icons.circle_outlined,
                color: users > 0 ? Colors.green : Colors.red,
                size: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
