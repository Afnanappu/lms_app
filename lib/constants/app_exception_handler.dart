import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class AppExceptionHandler {
  static String handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return "No Internet Connection";
    } else if (error is FormatException) {
      return "Invalid Data Format";
    } else if (error is TimeoutException) {
      return "Connection Timeout";
    } else if (error is TypeError) {
      return "Type error occurred";
    } else {
      return "Something went wrong";
    }
  }

  static String _handleDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection Timeout";
      case DioExceptionType.sendTimeout:
        return "Send Timeout";
      case DioExceptionType.receiveTimeout:
        return "Receive Timeout";
      case DioExceptionType.badResponse:
        return _handleStatusCode(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return "Request Cancelled";
      case DioExceptionType.connectionError:
        return "Connection Error";
      case DioExceptionType.unknown:
        return "Unexpected Error";
      case DioExceptionType.badCertificate:
        return "Bad Certificate";
    }
  }

  static String _handleStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      default:
        return "Received invalid status code: $statusCode";
    }
  }
}
