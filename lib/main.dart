import 'package:flutter/material.dart';
import 'package:lms_app/constants/app_theme.dart';
import 'package:lms_app/views/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), theme: AppTheme.lightTheme);
  }
}
