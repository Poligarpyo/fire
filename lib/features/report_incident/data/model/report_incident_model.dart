import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/report_incident.dart';

part 'report_incident_model.freezed.dart';
part 'report_incident_model.g.dart';

@freezed
abstract class ReportIncidentModel with _$ReportIncidentModel {
  const ReportIncidentModel._(); // ✅ REQUIRED when using extends

  const factory ReportIncidentModel({
    required double latitude,
    required double longitude,
    required String incidentType,
    required String severityLevel,
    required String additionalDetails,
  }) = _ReportIncidentModel;

  factory ReportIncidentModel.fromJson(Map<String, dynamic> json) =>
      _$ReportIncidentModelFromJson(json);
}

extension ReportIncidentModelX on ReportIncidentModel {
  // Convert ReportIncidentModel to ReportIncident Entity
  ReportIncident toEntity() => ReportIncident(
        latitude: latitude,
        longitude: longitude,
        incidentType: incidentType,
        severity: severityLevel,
        details: additionalDetails,
        image: null,
      );
}
