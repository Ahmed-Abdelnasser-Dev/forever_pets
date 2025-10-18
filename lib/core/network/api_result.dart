class ApiResult<T> {
  final T? data;
  final bool success;
  final dynamic error;

  ApiResult._({this.data, required this.success, this.error});

  factory ApiResult.success(T data) {
    return ApiResult._(data: data, success: true);
  }

  factory ApiResult.failure(dynamic error) {
    return ApiResult._(success: false, error: error);
  }
}
