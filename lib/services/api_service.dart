import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lms_app/constants/app_exception_handler.dart';

class ApiService {
  static const baseUrl = 'https://trogon.info/interview/php/api';

  final dio = Dio();

  void fetchSubjects() async {
    try {
      final response = await dio.get("$baseUrl/subjects.php");
      if (response.statusCode == 200) {
        log(jsonEncode(response.data));
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handle(e);
    }
  }
}
