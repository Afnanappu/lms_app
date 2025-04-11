import 'package:flutter/material.dart';
import 'package:lms_app/models/video_model.dart';
import 'package:lms_app/services/api_service.dart';

class VideosProvider extends ChangeNotifier {
  final ApiService _apiService;
  VideosProvider(this._apiService);

  List<VideoModel> videoModels = [];

  Future<void> fetchVideoModels(int moduleId) async {
    final data = await _apiService.fetchVideos(moduleId);

    videoModels = data;

    notifyListeners();
  }
}
