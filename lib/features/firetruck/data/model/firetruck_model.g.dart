// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firetruck_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FireTruckModel _$FireTruckModelFromJson(Map<String, dynamic> json) =>
    _FireTruckModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      incidentType: json['incidentType'] as String,
      severityLevel: json['severityLevel'] as String,
      additionalDetails: json['additionalDetails'] as String,
    );

Map<String, dynamic> _$FireTruckModelToJson(_FireTruckModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'incidentType': instance.incidentType,
      'severityLevel': instance.severityLevel,
      'additionalDetails': instance.additionalDetails,
    };
