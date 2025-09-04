// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sourse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourseModel _$SourseModelFromJson(Map<String, dynamic> json) => SourseModel(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$SourseModelToJson(SourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
    };
