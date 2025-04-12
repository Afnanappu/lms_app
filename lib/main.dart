import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_theme.dart';
import 'package:lms_app/services/api_service.dart';
import 'package:lms_app/view_models/modules_provider.dart';
import 'package:lms_app/view_models/subjects_provider.dart';
import 'package:lms_app/view_models/videos_provider.dart';
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
        ChangeNotifierProvider(
          create:
              (_) =>
                  SubjectProvider(apiService)
                    ..fetchSubjects(), // fetch subjects
        ),
        ChangeNotifierProvider(create: (_) => ModulesProvider(apiService)),
        ChangeNotifierProvider(create: (_) => VideosProvider(apiService)),
      ],
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LearnFlow',
            home: HomeScreen(),
            theme: AppTheme.lightTheme,
          ),
    );
  }
}
