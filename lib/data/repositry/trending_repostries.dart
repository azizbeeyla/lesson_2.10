import 'package:lesson2_10/data/result.dart';
import '../../core/clients/dio_cielent.dart';
import '../models/trending_models/recipies_detail.dart';

class TrendRecipesRepository {
  final ApiClient apiClient;

  TrendRecipesRepository({required this.apiClient});

  Future<Result<List<TrendRecipesDetail>>> getTrendRecipes({int limit = 3}) async {
    final result = await apiClient.get("/recipes/list?Limit=$limit");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        try {
          if (data is List) {
            final items = data
                .map((json) => TrendRecipesDetail.fromJson(json as Map<String, dynamic>))
                .toList();
            return Result.ok(items);
          } else {
            return Result.error(Exception("Noto‘g‘ri format: List emas"));
          }
        } catch (e) {
          return Result.error(Exception(e.toString()));
        }
      },
    );
  }
}
