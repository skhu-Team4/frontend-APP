import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renew/src/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20%EC%9A%94%EC%86%8C/myPage.dart';
import 'package:renew/src/%EC%B1%84%ED%8C%85%EA%B4%80%EB%A0%A8/chatList.dart';
import '../로그인관련/findIDPW.dart';
import '../로그인관련/login.dart';
import '../로그인관련/signUp.dart';
import '../수업추가/classAdd.dart';

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
      path: '/find-potatoes',
      builder: (context, state) => SearchPotatoes(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SearchPotatoes(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // 자연스러운 화면 전환 애니메이션
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/my-page',
      builder: (context, state) => MyPage(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: MyPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // 자연스러운 화면 전환 애니메이션
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/main-chatting',
      builder: (context, state) => MainChatting(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: MainChatting(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // 자연스러운 화면 전환 애니메이션
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
