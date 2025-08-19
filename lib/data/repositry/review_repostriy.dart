import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/review_model/review_model.dart';
import 'package:lesson2_10/data/result.dart';

class ReviewRepositry {
  final ApiClient _apiClient;

  ReviewRepositry({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<ReviewModel>> getReviewById(int id) async {
    final result = await _apiClient.get<dynamic>(
      "/recipes/reviews/detail/$id",
    );

    return result.fold(
          (error) => Result.error(error),
          (data) {
        try {
          final review = ReviewModel.fromJson(data);
          return Result.ok(review);
        } catch (e) {
          return Result.error(Exception(" Xatolik: $e"));
        }
      },
    );
  }
}
