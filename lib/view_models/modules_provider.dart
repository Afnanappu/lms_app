import 'package:flutter/material.dart';
import 'package:lms_app/models/module_model.dart';
import 'package:lms_app/services/api_service.dart';

class ModulesProvider extends ChangeNotifier {
  final ApiService _apiService;
  ModulesProvider(this._apiService);

  List<ModuleModel> _modules = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ModuleModel> get modules => _modules;

  Future<void> fetchModules(int subjectId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _modules = await _apiService.fetchModules(subjectId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
