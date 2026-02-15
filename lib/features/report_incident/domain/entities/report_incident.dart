import 'dart:io';

class ReportIncident {
  final String incidentType;
  final String severity;
  final String details;
  final double latitude;
  final double longitude;
  final File? image;
  ReportIncident({
    required this.incidentType,
    required this.severity,
    required this.details,
    required this.latitude,
    required this.longitude,
    required this.image,
  });
}
