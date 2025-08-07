class AllercigModel {
  final int id;
  final String image, title;

  AllercigModel({
    required this.id,
    required this.image,
    required this.title,
  });

  factory AllercigModel.fromJson(Map<String, dynamic> json) {
    return AllercigModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
