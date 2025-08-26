import 'package:flutter/material.dart';
import '../../../data/models/review_model/review_model.dart';
import '../../../data/repositry/review_repository/review_repostriy.dart';

class ReviewsViewModel extends ChangeNotifier {
  final ReviewRepositry _reviewRepo;

  ReviewModel? review;
  bool loading = false;
  String? error;

  ReviewsViewModel({
    required ReviewRepositry reviewRepo,
    required int categoryId,
  }) : _reviewRepo = reviewRepo {
    fetchReviewDetail(categoryId: categoryId);
  }

  Future<void> fetchReviewDetail({required int categoryId}) async {
    loading = true;
    error = null;
    notifyListeners();

    final result = await _reviewRepo.getReviewById(categoryId);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        review = data;
      },
    );

    loading = false;
    notifyListeners();
  }
}
