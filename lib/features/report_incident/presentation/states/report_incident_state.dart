import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_incident_state.freezed.dart';

@freezed
abstract class ReportIncidentState with _$ReportIncidentState {
  const factory ReportIncidentState({
    @Default(false) bool isLoading,
    File? selectedImage,
    double? latitude,
    double? longitude,
    String? errorMessage,
    @Default(false) bool isSubmitted,
  }) = _ReportIncidentState;
}
