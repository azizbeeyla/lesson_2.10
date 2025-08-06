class DetailModel {
  final int id;
  final String image;
  final String textname;
  final String textdetail;
  final int comments;
  final num textminute;
  final num textstar;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final User user;

  DetailModel({
    required this.id,
    required this.image,
    required this.textname,
    required this.textdetail,
    required this.textminute,
    required this.textstar,
    required this.comments,
    required this.ingredients,
    required this.instructions,
    required this.user,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'] ?? 0,
      image: json['photo'] ?? '',
      textname: json['title'] ?? '',
      textdetail: json['description'] ?? '',
      textminute: json['timeRequired'] ?? 0,
      textstar: num.tryParse(json['rating']?.toString() ?? '0') ?? 0,
      comments: json['comments'] ?? 0,
      ingredients: (json['ingredients'] as List? ?? [])
          .map((e) => Ingredient.fromJson(e))
          .toList(),
      instructions: (json['instructions'] as List? ?? [])
          .map((e) => Instruction.fromJson(e))
          .toList(),
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class Ingredient {
  final String name;
  final String amount;

  Ingredient({required this.name, required this.amount});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] ?? '',
      amount: json['amount'] ?? '',
    );
  }
}

class Instruction {
  final int order;
  final String text;

  Instruction({required this.order, required this.text});

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      order: json['order'] ?? 0,
      text: json['text'] ?? '',
    );
  }
}

class User {
  final String profilePhoto;
  final String username;
  final String firstname;

  User({
    required this.profilePhoto,
    required this.username,
    required this.firstname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profilePhoto: json['profilePhoto'] ?? '',
      username: json['username'] ?? '',
      firstname: json['firstname'] ?? '',
    );
  }
}
