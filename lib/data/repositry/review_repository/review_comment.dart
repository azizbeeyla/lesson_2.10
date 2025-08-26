import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/result.dart';

import '../../models/review_model/comment_model.dart';

class ReviewsCommentRepository {
  final ApiClient _apiClient;

  ReviewsCommentRepository({required ApiClient apiClient})
      : _apiClient = apiClient;

  Future<Result<List<ReviewsCommentModel>>> getComments(int categoryId) async {
    final result = await _apiClient.get<dynamic>(
      "/reviews/list?recipeId=$categoryId",
    );

    return result.fold(
          (error) => Result.error(error),
          (data) {
        try {
          final comments = (data as List)
              .map((item) => ReviewsCommentModel.fromJson(item))
              .toList();
          return Result.ok(comments);
        } catch (e) {
          return Result.error(Exception("Xatolik: $e"));
        }
      },
    );
  }
}
