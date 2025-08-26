class YourRecipeModel {
  final int id, categoryId;
  final String title;
  final String description;
  final String photo;
  final num timerequired;
  final num rating;

  YourRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.timerequired,
    required this.rating,


  });

  factory YourRecipeModel.fromJson(Map<String, dynamic>json){
    return YourRecipeModel(id: json['id'],
        categoryId: json['categoryId'],
        title: json['title']??"",
        description: json['description']??"",
        photo: json['photo'],
        timerequired: json['timeRequired']??0,
        rating: json['rating']??0);
  }
}
