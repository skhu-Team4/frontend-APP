import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 현재 위치를 가져옴
    final currentLocation =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    final currentIndex = currentLocation == '/find-potatoes'
        ? 0
        : currentLocation == '/main-chatting'
            ? 1
            : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8EB),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            '마이페이지',
            style: TextStyle(
                fontFamily: 'SF함박눈',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Divider(
            thickness: 1,
            color: Colors.black, // 검은색 라인
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/감자라능 1.png'),
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: [
                _buildTextButton(context, '프로필 사진 변경', '/'),
                _buildTextButton(context, '한 줄 소개 변경', '/'),
                _buildTextButton(context, '공지사항', '/'),
                _buildTextButton(context, '개인정보 수집 및 이용', '/'),
                _buildTextButton(context, '비밀번호 변경', '/'),
                _buildTextButton(context, '로그아웃', '/'),
                _buildTextButton(context, '탈퇴하기', '/'),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black, // 검은색 라인
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return; // 현재 선택된 탭이면 아무 작업도 안 함
          switch (index) {
            case 0:
              context.go('/find-potatoes');
              break;
            case 1:
              context.go('/main-chatting');
              break;
            case 2:
              context.go('/my-page');
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
        backgroundColor: Color(0xFFFFF8EB),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          context.go(route); // 전달받은 라우트로 이동
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontFamily: '고운다움',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
