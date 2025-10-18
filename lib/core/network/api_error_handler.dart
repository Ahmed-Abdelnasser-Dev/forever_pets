import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return ApiErrorModel(
          message: error.response?.data.toString() ?? 'Unknown Dio Error',
          code: error.response?.statusCode,
        );
      } else {
        return ApiErrorModel(message: error.message);
      }
    } else if (error is Exception) {
      return ApiErrorModel(message: error.toString());
    } else {
      return ApiErrorModel(message: 'Unexpected error occurred');
    }
  }
}
