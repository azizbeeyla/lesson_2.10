import 'package:lesson2_10/data/result.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';

import '../../models/your_recipe_model/your_recipe.dart';

class YourRecipeRepository {
  final ApiClient _apiClient;

  List<YourRecipeModel> _yourRecipes = [];

  YourRecipeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<YourRecipeModel>>> fetchYourRecipes({int limit = 8}) async {
    if (_yourRecipes.isNotEmpty) return Result.ok(_yourRecipes);

    final result = await _apiClient.get("/recipes/list?Limit=$limit");
    print("Recipe API response: $result");


    return result.fold(
          (err) => Result.error(err),
          (data) {
        try {
          if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
            _yourRecipes = data.map((x) => YourRecipeModel.fromJson(x)).toList();
            return Result.ok(_yourRecipes);
          } else if (data is List && data.isEmpty) {
            return Result.ok([]);
          } else {
            return Result.error(Exception("Noto‘g‘ri format: List emas yoki bo‘sh List"));
          }
        } catch (e) {
          return Result.error(Exception(e.toString()));
        }
      },
    );
  }


}
