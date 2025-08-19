class ChefModel {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String profilePhoto;

  ChefModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.profilePhoto,
  });

  factory ChefModel.fromJson(Map<String, dynamic> json) {
    return ChefModel(
      id: json['id'],
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      username: json['username'] ?? "",
      profilePhoto: json['profilePhoto'],
    );
  }
}
