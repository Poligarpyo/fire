import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/firetruck.dart'; 

part 'firetruck_model.freezed.dart';
part 'firetruck_model.g.dart';

@freezed
abstract class FireTruckModel with _$FireTruckModel {
  const FireTruckModel._(); // ✅ REQUIRED when using extends

  const factory FireTruckModel({
    required double latitude,
    required double longitude,
    required String incidentType,
    required String severityLevel,
    required String additionalDetails,
  }) = _FireTruckModel;

  factory FireTruckModel.fromJson(Map<String, dynamic> json) =>
      _$FireTruckModelFromJson(json);
}

extension FireTruckModelX on FireTruckModel {
  // Convert FireTruckModel to FireTruck Entity
  FireTruck toEntity() => FireTruck(
        latitude: latitude,
        longitude: longitude,
        incidentType: incidentType,
        severity: severityLevel,
        details: additionalDetails,
        image: null,
      );
}
