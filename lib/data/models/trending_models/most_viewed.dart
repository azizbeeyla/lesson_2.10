class MostViewedModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String photo;
  final num timeRequired;
  final num rating;

  MostViewedModel( {
    required this.categoryId,
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory MostViewedModel.fromJson(Map<String, dynamic> json) {
    return MostViewedModel(

        id: json['id'] ,
        title: json['title']?? "" ,
        description: json['description'] ?? "" ,
        photo: json['photo']?? "" ,
        timeRequired: json['timerequired']??0 ,
        rating: json['rating']??0, categoryId:json['categoryId']);


  }
}
