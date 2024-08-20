import 'package:flutter/material.dart';
import 'package:school_app_demo/utils/theme.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App Demo',
      theme: appTheme(),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
