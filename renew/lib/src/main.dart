import 'package:flutter/material.dart';
import 'Routes/goRouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Potatalk',
      routerConfig: router, // GoRouter를 연결
    );
  }
}
