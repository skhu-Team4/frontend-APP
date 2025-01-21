import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../기타주소/url.dart';

class MainChatting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 현재 위치를 가져옴
    final currentLocation =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    // currentLocation에 맞게 currentIndex 계산
    final currentIndex = currentLocation == '/find-potatoes'
        ? 0
        : currentLocation == '/main-chatting'
            ? 1
            : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EB),
      body: Stack(
        children: [
          Positioned(
            top: 65,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.go('/find-potatoes'); // 감자찾기 화면으로 돌아가기
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
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          '감자 찾기',
                          style: TextStyle(
                            fontFamily: 'SF함박눈',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // URL을 열 수 있는지 확인
                          if (url.isNotEmpty) {
                            try {
                              final uri = Uri.parse(url); // URL을 Uri로 변환
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                print('URL을 열 수 없습니다. : $uri');
                              }
                            } catch (e) {
                              print('URL 열기 중 오류 발생 : $e');
                            }
                          } else {
                            // URL을 열 수 없을 때
                            print('URL을 열 수 없습니다.');
                          }
                        },
                        child: Image(
                          image: AssetImage('assets/images/skhuAd.png'),
                          height: 78,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black, // 검은색 라인
                        indent: 10,
                        endIndent: 10,
                      ),
                      Text('아직 채팅이 없어요.'),
                      SizedBox(
                        height: 470,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black, // 검은색 라인
                        indent: 10,
                        endIndent: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 경로에 맞는 인덱스 설정
        onTap: (index) {
          if (index == currentIndex) return; // 현재 선택된 탭이면 아무 작업도 안 함
          switch (index) {
            case 0:
              context.go('/find-potatoes'); // 감자 찾기
              break;
            case 1:
              context.go('/main-chatting'); // 채팅 화면
              break;
            case 2:
              context.go('/my-page'); // 마이페이지
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
}
