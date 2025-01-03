import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:first/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Potatalk',
      routerConfig: router, // GoRouter를 연결
    );
  }
}
