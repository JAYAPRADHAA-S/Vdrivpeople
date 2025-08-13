import 'package:flutter/material.dart';
import 'screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VDrive People',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD300),
      ),
      home: const LoginScreen(),
    );
  }
}
