class SourseModel {
  final int id;
  final String image, title;

  SourseModel({required this.id, required this.image, required this.title});

  factory SourseModel.fromJson(Map<String, dynamic> json) {
    return SourseModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
