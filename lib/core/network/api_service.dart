import 'package:dio/dio.dart';
import 'package:forever_pets/features/home/data/breeds_model.dart';
import 'dio_factory.dart';
import 'api_constants.dart';
import 'api_error_handler.dart';
import 'api_result.dart';

class ApiService {
  ApiService._();
  static final ApiService instance = ApiService._();

  final Dio _dio = DioFactory.getDio();

  Future<ApiResult<List<BreedsModel>>> fetchBreeds({
    final int? limit,
    final int? page,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}breeds',
        queryParameters: {'limit': limit, 'page': page},
      );

      if (response.statusCode == 200) {
        List data = response.data;
        final breeds = data
            .map((json) => BreedsModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return ApiResult.success(breeds);
      } else {
        return ApiResult.failure(
          ApiErrorHandler.handleError(
            'Failed to load breeds with code ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
