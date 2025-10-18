import 'package:forever_pets/core/network/api_result.dart';
import 'package:forever_pets/core/network/api_service.dart';
import 'package:forever_pets/features/home/data/breeds_model.dart';

class BreedsRepository {
  BreedsRepository._();
  static final BreedsRepository instance = BreedsRepository._();

  final ApiService _apiService = ApiService.instance;

  Future<ApiResult<List<BreedsModel>>> getBreeds({
    int limit = 6,
    int page = 1,
  }) async {
    return await _apiService.fetchBreeds(limit: limit, page: page);
  }
}
