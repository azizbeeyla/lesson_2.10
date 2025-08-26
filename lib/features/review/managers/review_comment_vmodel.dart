import 'package:flutter/material.dart';
import '../../../data/models/review_model/comment_model.dart';
import '../../../data/repositry/review_repository/review_comment.dart';

class ReviewsCommentViewModel extends ChangeNotifier {
  final ReviewsCommentRepository _commentRepo;

  List<ReviewsCommentModel> comments = [];
  bool loading = false;
  String? error;

  ReviewsCommentViewModel({
    required ReviewsCommentRepository commentRepo,
    required int categoryId,
  }) : _commentRepo = commentRepo {
    fetchReviewDetailComment(categoryId: categoryId);
  }

  Future<void> fetchReviewDetailComment({required int categoryId}) async {
    loading = true;
    error = null;
    notifyListeners();

    final result = await _commentRepo.getComments(categoryId);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        comments = data;
      },
    );

    loading = false;
    notifyListeners();
  }
}
