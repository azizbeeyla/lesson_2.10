import 'package:flutter/material.dart';
import '../../../data/repositry/review_repository/review_add.dart';
import '../../../data/models/review_model/reviev_add.dart';

class ReviewsAddViewModel extends ChangeNotifier {
  final ReviewsAddRepository _reviewsAddRepo;

  ReviewsAddModel? reviewadd;
  bool loading = false;
  String? error;

  ReviewsAddViewModel({
    required ReviewsAddRepository reviewsAddRepo,
    required int categoryId,
  }) : _reviewsAddRepo = reviewsAddRepo {
    fetchReviewCommentAdd(categoryId: categoryId);
  }


  Future<void> fetchReviewCommentAdd({required int categoryId}) async {
    loading = true;
    error = null;
    notifyListeners();

    final result = await _reviewsAddRepo.addReview(categoryId);

    result.fold(
      (err) {
        error = err.toString();
      },
      (data) {
        reviewadd = data;
      },
    );

    loading = false;
    notifyListeners();
  }
}
