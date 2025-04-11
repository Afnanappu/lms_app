import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lms_app/constants/app_exception_handler.dart';
import 'package:lms_app/models/subject_model.dart';

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
}
