import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class AppExceptionHandler {
  /// Handles a given error and returns a user-friendly string describing the issue.
  ///
  /// The error is checked against the following types and returned as a string:
  ///
  /// - `DioException`: calls `_handleDioError` to handle the error.
  /// - `SocketException`: returns "No Internet Connection".
  /// - `FormatException`: returns "Invalid Data Format".
  /// - `TimeoutException`: returns "Connection Timeout".
  /// - `TypeError`: returns "Type error occurred".
  /// - All other errors: returns "Something went wrong".
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
        return handleStatusCode(dioError.response?.statusCode);
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

  /// Handles a given status code and returns a user-friendly string describing the issue.
  ///
  /// The status code is checked against the following values and returned as a string:
  ///
  /// - 400: returns "Bad Request".
  /// - 401: returns "Unauthorized".
  /// - 403: returns "Forbidden".
  /// - 404: returns "Not Found".
  /// - 500: returns "Internal Server Error".
  /// - All other status codes: returns "Received invalid status code: $statusCode".
  static String handleStatusCode(int? statusCode) {
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
