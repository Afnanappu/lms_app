import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lms_app/core/constants/app_exception_handler.dart';
import 'package:lms_app/models/module_model.dart';
import 'package:lms_app/models/subject_model.dart';
import 'package:lms_app/models/video_model.dart';

class ApiService {
  static const baseUrl = 'https://trogon.info/interview/php/api';

  final dio = Dio();

  Future<List<SubjectModel>> fetchSubjects() async {
    try {
      final response = await dio.get("$baseUrl/subjects.php");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.data) as List;
        return data.map((e) => SubjectModel.fromMap(e)).toList();
      } else {
        throw AppExceptionHandler.handleStatusCode(response.statusCode);
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handle(e);
    }
  }

  Future<List<ModuleModel>> fetchModules(int subjectId) async {
    try {
      final response = await dio.get(
        "$baseUrl/modules.php",
        queryParameters: {"subject_id": subjectId},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.data) as List;
        return data.map((e) => ModuleModel.fromMap(e)).toList();
      } else {
        throw AppExceptionHandler.handleStatusCode(response.statusCode);
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handle(e);
    }
  }

  Future<List<VideoModel>> fetchVideos(int moduleId) async {
    try {
      final response = await dio.get(
        "$baseUrl/modules.php",
        queryParameters: {"module_id": moduleId},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.data) as List;
        return data.map((e) => VideoModel.fromMap(e)).toList();
      } else {
        throw AppExceptionHandler.handleStatusCode(response.statusCode);
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handle(e);
    }
  }
}
