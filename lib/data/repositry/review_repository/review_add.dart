import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/review_model/reviev_add.dart';
import 'package:lesson2_10/data/result.dart';

class ReviewsAddRepository {
  final ApiClient _apiClient;

  ReviewsAddRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<ReviewsAddModel>> addReview(int categoryId) async {
    final result = await _apiClient.get<dynamic>(
      "/recipes/create-review/$categoryId",
    );

    return result.fold(
          (error) => Result.error(error),
          (data) {
        try {
          final review = ReviewsAddModel.fromJson(data);
          return Result.ok(review);
        } catch (e) {
          return Result.error(Exception("Xatolik: $e"));
        }
      },
    );
  }
}
