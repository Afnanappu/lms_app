import 'package:flutter/material.dart';
import 'package:lms_app/models/subject_model.dart';
import 'package:lms_app/services/api_service.dart';

class SubjectProvider extends ChangeNotifier {
  final ApiService _apiService;
  SubjectProvider(this._apiService);

  List<SubjectModel> subjects = [];

  Future<void> fetchSubjects() async {
    final data = await _apiService.fetchSubjects();

    subjects = data;

    notifyListeners();
  }
}
