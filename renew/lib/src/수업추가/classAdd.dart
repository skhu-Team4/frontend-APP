import 'package:flutter/material.dart';

import 'recommand.dart';
// recommand.dart 파일을 추가하여 추천 화면으로 이동

class SearchPotatoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EB), // 배경 색상
      body: Stack(
        children: [
          // 뒤로 가기 버튼
          Positioned(
            top: 65,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 로고와 제목
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Center(
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                            'assets/images/Hotpotato.png'), // 로고 이미지 경로
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
              // 검색창 모양 (검색창처럼 버튼 스타일로 클릭 시 recommand.dart로 이동)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // 검색창 클릭 시 recommand.dart로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommandPage()),
                    );
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
              // 내 강의 텍스트
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
              // 강좌 리스트
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
      // 하단 아이콘 버튼 부분
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        backgroundColor: Color(0xFFFFF8EB), // 하단 색상
        selectedItemColor: Colors.black, // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
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

// 추천 검색어 페이지 (recommand.dart)
