class UserCommunityModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  UserCommunityModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserCommunityModel.fromJson(Map<String, dynamic> json) {
    return UserCommunityModel(
      id: json['id'],
      profilePhoto: json['profilePhoto']??"",
      username: json['username']??"",
      firstName: json['firstName']??"",
      lastName: json['lastName']??"",
    );
  }
}
