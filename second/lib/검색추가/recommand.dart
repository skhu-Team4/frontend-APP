import 'package:flutter/material.dart';

class RecommandPage extends StatefulWidget {
  @override
  _RecommandPageState createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // 검색창에 자동 포커스를 주기 위한 FocusNode

  @override
  void initState() {
    super.initState();
    // 화면 전환 시 자동으로 검색창에 포커스 주기
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EB), // 배경 색상
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8EB),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // 자동 포커스를 주는 검색창
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: '과목명, 교수명으로 검색',
                labelStyle: TextStyle(
                  fontFamily: 'SF함박눈',
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),

            // 추천 항목들
            Text(
              '#전공',
              style: TextStyle(
                fontFamily: 'SF함박눈',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // 전공 추천 항목들
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildChip('기독교문화전공'),
                _buildChip('영어학전공'),
                _buildChip('사회학전공'),
                _buildChip('경제학전공'),
                _buildChip('정치학전공'),
                _buildChip('인공지능전공'),
                _buildChip('디지털콘텐츠전공'),
                _buildChip('소프트웨어공학전공'),
              ],
            ),
            SizedBox(height: 20),

            // 교수님 추천 항목
            Text(
              '#교수님',
              style: TextStyle(
                fontFamily: 'SF함박눈',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // 교수님 추천 항목들
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildChip('요코야마 나오코'),
                _buildChip('유상신'),
                _buildChip('김선형'),
                _buildChip('김학수'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 추천 항목을 나타내는 둥근 버튼 형태
  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade300,
      shape: StadiumBorder(),
    );
  }
}
