// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_incident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportIncidentModel _$ReportIncidentModelFromJson(Map<String, dynamic> json) =>
    _ReportIncidentModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      incidentType: json['incidentType'] as String,
      severityLevel: json['severityLevel'] as String,
      additionalDetails: json['additionalDetails'] as String,
    );

Map<String, dynamic> _$ReportIncidentModelToJson(
  _ReportIncidentModel instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'incidentType': instance.incidentType,
  'severityLevel': instance.severityLevel,
  'additionalDetails': instance.additionalDetails,
};
