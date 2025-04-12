import 'package:flutter/material.dart';
import 'package:lms_app/models/subject_model.dart';
import 'package:lms_app/services/api_service.dart';

class SubjectProvider extends ChangeNotifier {
  final ApiService _apiService;
  SubjectProvider(this._apiService);

  List<SubjectModel> _subjects = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<SubjectModel> get subjects => _subjects;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchSubjects() async {
    _isLoading = true;
    notifyListeners();
    try {
      _subjects = await _apiService.fetchSubjects();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
