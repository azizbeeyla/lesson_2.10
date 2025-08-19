class TrendRecipesDetail {
  final int id, categoryId;
  final String title, description, photo;
  final num timeRequired;
  final num rating;

  TrendRecipesDetail({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendRecipesDetail.fromJson(Map<String, dynamic> json) {
    return TrendRecipesDetail(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      photo: json['photo'],
      timeRequired: json['timeRequired'] ?? 0,
      rating: json['rating'] ?? 0,
    );
  }
}
