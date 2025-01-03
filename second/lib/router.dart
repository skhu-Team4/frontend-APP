import 'package:first/%EB%A1%9C%EA%B7%B8%EC%9D%B8%EA%B4%80%EB%A0%A8/signUp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '로그인관련/login.dart';
import '로그인관련/findIDPW.dart';
import '검색추가/findPot.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/', // 로그인 화면
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/find-idpw',
      builder: (context, state) {
        final int initialTabIndex = state.extra as int? ?? 0; // 탭 인덱스 전달
        return FindIDPWScreen(initialTabIndex: initialTabIndex);
      },
    ),
    GoRoute(
      path: '/sign-up', // 회원가입 페이지 추가
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/find-potatoes', // 감자 찾기 화면으로 이동
      builder: (context, state) => SearchPotatoes(),
    ),
  ],
);
