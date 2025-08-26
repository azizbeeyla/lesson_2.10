
import '../../core/clients/dio_cielent.dart';
import '../models/comunity_models/comunity_model.dart';
import '../result.dart';

class CommunityRepository {
  CommunityRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<Result<List<CommunityModel>>> getAll(Map<String, dynamic> queryParams) async {
    var response = await _apiClient.get<List>("/recipes/community/list", queryParams: queryParams);
    return response.fold(
          (error) => Result.error(error),
          (val) => Result.ok(
        val.map((item) => CommunityModel.fromJson(item)).toList(),
      ),
    );
  }
}