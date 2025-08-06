class RecipiesModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final int comments;
  final num stars;
  final int timeRequired;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final User user;

  RecipiesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.stars,
    required this.comments,
    required this.timeRequired,
    required this.ingredients,
    required this.instructions,
    required this.user,
  });

  factory RecipiesModel.fromJson(Map<String, dynamic> json) {
    return RecipiesModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['photo'] ?? '',
      description: json['description'] ?? '',
      stars: num.tryParse(json['stars']?.toString() ?? '0') ?? 0,
      comments: int.tryParse(json['comments']?.toString() ?? '0') ?? 0,
      timeRequired: int.tryParse(json['timeRequired']?.toString() ?? '0') ?? 0,
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

class Ingredient {
  final String name;
  final String amount;

  Ingredient({
    required this.name,
    required this.amount,
  });

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

  Instruction({
    required this.order,
    required this.text,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      order: json['order'] ?? 0,
      text: json['text'] ?? '',
    );
  }
}
