import 'package:dio/dio.dart';

import '../values/constants.dart';

class ExceptionHandler {
  static Exception handleError(e, {String? functionName}) {
    if (e.runtimeType == DioException) {
      logError(
          '${functionName != null ? '$functionName | ' : ''}API Error: ${e.error} | Response: ${e.response}');
      return Exception(e.error);
    }
    return Exception('$functionName | $e');
  }
}
