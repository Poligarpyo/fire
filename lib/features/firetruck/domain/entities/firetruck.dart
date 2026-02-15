import 'dart:io';

class FireTruck {
  final String incidentType;
  final String severity;
  final String details;
  final double latitude;
  final double longitude;
  final File? image;
  FireTruck({
    required this.incidentType,
    required this.severity,
    required this.details,
    required this.latitude,
    required this.longitude,
    required this.image,
  });
}
