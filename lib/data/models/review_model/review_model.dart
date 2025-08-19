import 'package:lesson2_10/data/models/review_model/review_user.dart';

class ReviewModel {
  final int id;
  final String title;
  final String photo;
  final num rating;
  final num reviewsCount;
  final ReviewUser user;

  ReviewModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      user: ReviewUser.fromJson(json['user']),
    );
  }
}
