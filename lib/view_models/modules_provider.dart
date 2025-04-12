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

  /// Fetches the list of modules for a given [subjectId] from the API
  ///
  /// Updates the [modules], [errorMessage] and [isLoading] fields
  /// accordingly. Notifies the listeners when the operation is complete.
  ///
  /// throws message on error
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
