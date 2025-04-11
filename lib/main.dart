import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_theme.dart';
import 'package:lms_app/services/api_service.dart';
import 'package:lms_app/view_models/subject_provider.dart';
import 'package:lms_app/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider(apiService)),
      ],
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: AppTheme.lightTheme,
          ),
    );
  }
}
