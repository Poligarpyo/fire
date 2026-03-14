import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class ReportIncidentState with _$ReportIncidentState {
  const factory ReportIncidentState({
    @Default(false) bool isLoading,
    @Default('Building Fire') String incidentType,
    @Default('Minor (Small fire, controllable)') String severity,
    @Default('') String details,
    File? selectedImage,
    double? latitude,
    double? longitude,
    String? errorMessage,
    @Default(false) bool isSubmitted,
  }) = _ReportIncidentState;
}