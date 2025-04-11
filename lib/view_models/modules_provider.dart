import 'package:flutter/material.dart';
import 'package:lms_app/models/module_model.dart';
import 'package:lms_app/services/api_service.dart';

class ModulesProvider extends ChangeNotifier {
  final ApiService _apiService;
  ModulesProvider(this._apiService);

  List<ModuleModel> modules = [];

  Future<void> fetchModules(int subjectId) async {
    final data = await _apiService.fetchModules(subjectId);
    modules = data;
    notifyListeners();
  }
}
