import 'package:json_annotation/json_annotation.dart';

part 'sourse_model.g.dart';

@JsonSerializable()
class SourseModel {
  final int id;
  final String image, title;

  SourseModel({required this.id, required this.image, required this.title});

  factory SourseModel.fromJson(Map<String, dynamic> json) =>
      _$SourseModelFromJson(json);
}
