class CusinesModel {
  final int id;
  final String image, title;

  CusinesModel({required this.id, required this.image, required this.title});

  factory CusinesModel.fromJson(Map<String, dynamic> json) {
    return CusinesModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
