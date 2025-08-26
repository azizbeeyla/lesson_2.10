import 'package:lesson2_10/data/models/comunity_models/user.dart';

class CommunityModel {
  final int id;
  final String description;
  final String title;
  final String photo;
  final num timeRequired;
  final num rating;
  final num reviewsCount;
  final String created;
  final UserCommunityModel user;

  CommunityModel({
    required this.id,
    required this.description,
    required this.title,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      photo: json['photo'],
      timeRequired: json['timeRequired'] ?? 0,
      rating: json['rating'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
      created: json['created']??"",
      user: UserCommunityModel.fromJson(json['user']??""),
    );
  }
}
