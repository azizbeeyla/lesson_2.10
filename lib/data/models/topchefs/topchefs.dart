class TopChefsModel {
  final int id;
  final String photo;
  final String lastName;
  final String username;
  final String firstName;

  TopChefsModel({
    required this.id,
    required this.username,
    required this.lastName,
    required this.photo,
    required this.firstName,
  });

  factory TopChefsModel.fromJson(Map<String, dynamic> json) {
    return TopChefsModel(
      id: json['id'],
      photo: json['profilePhoto']??"",
      firstName: json['firstName']??"",
      username: json['username']??"",
      lastName: json['lastName']??"",
    );
  }
}
