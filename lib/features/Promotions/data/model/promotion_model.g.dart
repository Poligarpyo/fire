// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) =>
    _PromotionModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$PromotionModelToJson(_PromotionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'link': instance.link,
    };
