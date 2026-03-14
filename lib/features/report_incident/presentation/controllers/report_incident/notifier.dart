import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/geolocator/getCurrentLocation.dart';
import '../../../domain/entities/report_incident.dart';
import '../../../domain/usecases/send_report_incident_usecase.dart';
import '../../providers/report_incident_providers.dart';
import 'state.dart';

final reportIncidentNotifierProvider =
    StateNotifierProvider<ReportIncidentNotifier, ReportIncidentState>((ref) {
      final sendReportIncidentUseCase = ref.read(
        sendReportIncidentUseCaseProvider,
      );
      return ReportIncidentNotifier(ref, sendReportIncidentUseCase);
    });

class ReportIncidentNotifier extends StateNotifier<ReportIncidentState> {
  final Ref ref;
  final SendReportIncidentUseCase sendReportIncidentUseCase;

  ReportIncidentNotifier(this.ref, this.sendReportIncidentUseCase)
    : super(const ReportIncidentState());

  Future<void> sendReport() async {
    final currentState = state;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await Future.delayed(const Duration(seconds: 1));
      final position = await getCurrentLocation();

      final report = ReportIncident(
        incidentType: currentState.incidentType,
        severity: currentState.severity,
        details: currentState.details,
        latitude: position.latitude,
        longitude: position.longitude,
        image: currentState.selectedImage,
      );

      final result = await sendReportIncidentUseCase(report);

      result.when(
        success: (_) {
          state = state.copyWith(isLoading: false, isSubmitted: true);
        },
        failure: (error) {
          state = state.copyWith(isLoading: false, errorMessage: error.message);
        },
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      state = state.copyWith(selectedImage: File(pickedFile.path));
    }
  }

  void removeImage() {
    state = state.copyWith(selectedImage: null);
  }

  void setIncidentType(String type) {
    state = state.copyWith(incidentType: type);
  }

  void setSeverity(String severity) {
    state = state.copyWith(severity: severity);
  }

  void setDetails(String details) {
    state = state.copyWith(details: details);
  }
}
