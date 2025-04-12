import 'package:flutter/material.dart';
import 'package:lms_app/models/subject_model.dart';
import 'package:lms_app/services/api_service.dart';

class SubjectProvider extends ChangeNotifier {
  final ApiService _apiService;
  SubjectProvider(this._apiService);

  List<SubjectModel> _subjects = [];
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<SubjectModel> get subjects => _subjects;

  /// Fetches the list of subjects from the API. If a [query] is provided, it will filter the
  /// subjects to only include those that contain the query in their title (case insensitive).
  ///
  /// Updates the [subjects], [isLoading] and [errorMessage] fields accordingly. Notifies the
  /// listeners when the operation is complete.
  ///
  /// throws message on error
  Future<void> fetchSubjects([String? query]) async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _apiService.fetchSubjects();
      _errorMessage = null;

      // when searching
      if (query != null) {
        _subjects =
            data
                .where(
                  (element) =>
                      element.title.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      } else {
        _subjects = data;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
