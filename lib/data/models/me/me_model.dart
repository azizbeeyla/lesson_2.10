class MeModel {
  final int id;
  final String username;
  final String profilePhoto;
  final String firstName;
  final String lastName;
  final String presentation;
  final num recipesCount;
  final num followingCount, followerCount;

  MeModel({
    required this.id,
    required this.username,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory MeModel.fromJson(Map<String, dynamic> json) {
    return MeModel(
      id: json['id'],
      username: json['username'] ?? "",
      profilePhoto: json['profilePhoto'] ?? '',
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? '',
      presentation: json['presentation'] ?? '',
      recipesCount: json['recipesCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      followerCount: json['followerCount'] ?? 0,
    );
  }
}
