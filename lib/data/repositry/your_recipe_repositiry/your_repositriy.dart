import 'package:lesson2_10/data/result.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';

import '../../models/your_recipe_model/your_recipe.dart';

class YourRecipeRepository {
  final ApiClient _apiClient;


  YourRecipeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<YourRecipeModel>>> getYourRecipes() async {
    var response = await _apiClient.get<List>("/recipes/my-recipes");
    return response.fold(
          (error) => Result.error(error),
          (val) => Result.ok(
        val.map((item) => YourRecipeModel.fromJson(item)).toList(),
      ),
    );
  }
  }



