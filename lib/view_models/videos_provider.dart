import 'package:flutter/material.dart';
import 'package:lms_app/models/video_model.dart';
import 'package:lms_app/services/api_service.dart';

class VideosProvider extends ChangeNotifier {
  final ApiService _apiService;
  VideosProvider(this._apiService);

  List<VideoModel> _videoModels = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<VideoModel> get videoModels => _videoModels;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVideoModels(int moduleId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _videoModels = await _apiService.fetchVideos(moduleId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
