import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7E8), // 배경색
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 로고 (SizedBox로 비워둠)
            SizedBox(
              height: 150,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/Hotpotato.png'),
                ),
              ),
            ),
            const SizedBox(height: 60),

            // 로그인 텍스트
            const Text(
              '로그인',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // 아이디 입력 필드
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '아이디를 입력해주세요',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 비밀번호 입력 필드
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호를 입력해주세요',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 아이디 찾기, 비밀번호 찾기
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.push('/find-idpw', extra: 0); // 아이디 찾기 탭
                  },
                  child: const Text('아이디 찾기'),
                ),
                const Text(" | "),
                TextButton(
                  onPressed: () {
                    context.push('/find-idpw', extra: 1); // 비밀번호 찾기 탭
                  },
                  child: const Text('비밀번호 찾기'),
                ),
              ],
            ),
            const SizedBox(height: 100),

            // 로그인 버튼
            SizedBox(
              width: 300,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B841), // 버튼 색상
                  foregroundColor: Colors.white, // 글자 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // 로그인 기능
                  context.go('/find-potatoes');
                },
                child: const Text(
                  '로그인',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 회원가입 버튼
            SizedBox(
              width: 300,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFFF5B841), // 테두리 색상
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // 회원가입 화면으로 이동
                  context.push('/sign-up');
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(0xFFF5B841),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
