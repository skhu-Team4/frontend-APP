import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
                        '회원가입',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        thickness: 1,
                        color: Colors.black, // 검은색 라인
                        indent: 30,
                        endIndent: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(), // 드래그 가능하도록 추가
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SignUpField(
                        label: '아이디',
                        hintText: '아이디',
                        buttonText: '중복 확인',
                        buttonWidth: 100, // 버튼 크기 지정
                      ),
                      const SizedBox(height: 20),
                      SignUpField(
                        label: '학교 이메일',
                        hintText: '이메일 주소 (@skhu.ac.kr)',
                        buttonText: '인증메일 발송',
                        buttonWidth: 100, // 버튼 크기 지정
                      ),
                      const SizedBox(height: 20),
                      const CustomTextField(
                        label: '비밀번호',
                        hintText: '비밀번호',
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      const CustomTextField(
                        label: '비밀번호 확인',
                        hintText: '비밀번호 확인',
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      const CustomIntroField(
                        label: '한 줄 소개',
                        hintText:
                            '예시) 저는 일어일문학과와 영어학과를 주전공, 부전공으로 하고 있습니다. 평소에 일본애니를 좋아해서 일본어를 요즘 열심히 공부하고 있고 꿈은 일본어 소설 번역가가 되는게 꿈입니다. 어플을 통해서 같은 학과에 대한 정보, 일본어 자격증 등에 대해서 이야기 나눌 사람 어디 없나요?',
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: SizedBox(
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
                            ).copyWith(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color(0xFFFFE6B3); // 눌렀을 때 배경색
                                  }
                                  return Colors.white; // 기본 배경색
                                },
                              ),
                            ),
                            onPressed: () {
                              // 회원가입 화면으로 이동
                              // context.push('/sign-up');
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SignUpField extends StatelessWidget {
  final String label;
  final String hintText;
  final String buttonText;
  final double buttonWidth; // 버튼 크기 추가

  const SignUpField({
    required this.label,
    required this.hintText,
    required this.buttonText,
    required this.buttonWidth, // 버튼 크기 초기화
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 12, // 힌트 글자 크기
                    color: Colors.grey, // 힌트 글자 색상
                  ),
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(buttonWidth, 40), // 버튼 크기 설정
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFFFFB74D)), // 테두리 색
              ),
              onPressed: () {
                // 버튼 동작
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Color(0xFFFFB74D), // 텍스트 색
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomIntroField extends StatelessWidget {
  final String label;
  final String hintText;

  const CustomIntroField({
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          hintText,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey, // 회색 텍스트
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 80, // 텍스트 필드 높이 조정
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white, // 하얀색 배경
            border: Border.all(color: Colors.grey), // 테두리 색상
            borderRadius: BorderRadius.circular(0), // 둥근 모서리
          ),
          child: Scrollbar(
            thumbVisibility: true, // 스크롤바 항상 표시
            controller: scrollController, // 스크롤 컨트롤러 연결
            child: SingleChildScrollView(
              controller: scrollController, // 스크롤 컨트롤러 연결
              child: TextField(
                maxLines: null, // 무제한 입력 가능
                decoration: const InputDecoration(
                  hintText: '양식에 맞게 입력하세요.',
                  hintStyle: TextStyle(
                    fontSize: 12, // 힌트 글자 크기
                    color: Colors.grey, // 회색 텍스트 색상
                  ),
                  border: InputBorder.none, // 내부 테두리 제거
                ),
                style: const TextStyle(
                  fontSize: 12, // 입력 글자 크기
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final int maxLines;

  const CustomTextField({
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          obscureText: isPassword,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 12, // 힌트 글자 크기
              color: Colors.grey, // 힌트 글자 색상
            ),
            border: const UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
