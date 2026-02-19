// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_sms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfflineSmsModel _$OfflineSmsModelFromJson(Map<String, dynamic> json) =>
    _OfflineSmsModel(
      id: json['id'] as String,
      message: json['message'] as String,
      phoneNumber: json['phoneNumber'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      sentViaSms: json['sentViaSms'] as bool? ?? false,
      syncStatus: (json['syncStatus'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OfflineSmsModelToJson(_OfflineSmsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'phoneNumber': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'sentViaSms': instance.sentViaSms,
      'syncStatus': instance.syncStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
