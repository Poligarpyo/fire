// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      result: json['result'] as bool,
      lastName: json['lastName'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };
