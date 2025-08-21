class TopChefsDetailModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, firstName, lastName, presentation;

  TopChefsDetailModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
  });

  factory TopChefsDetailModel.fromJson(Map<String, dynamic> json) {
    return TopChefsDetailModel(
      id: json["id"] ,
      recipesCount: json["recipesCount"] ?? 0,
      followingCount: json["followingCount"] ?? 0,
      followerCount: json["followerCount"] ?? 0,
      profilePhoto: json["profilePhoto"] ,
      username: json["username"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      presentation: json["presentation"] ?? "",
    );
  }}