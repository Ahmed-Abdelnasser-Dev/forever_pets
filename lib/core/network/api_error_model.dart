class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({required this.message, this.code});

  @override
  String toString() {
    if (code != null) {
      return 'ApiError(code: $code, message: $message)';
    }
    return 'ApiError(message: $message)';
  }
}
