import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/geolocator/getCurrentLocation.dart';
import '../../domain/entities/report_incident.dart';
import '../../domain/usecases/set_report_incident_usecase.dart';
import '../states/report_incident_state.dart';

class ReportIncidentNotifier extends StateNotifier<ReportIncidentState> {
  final SendReportIncidentUseCase sendReportIncidentUseCase;

  ReportIncidentNotifier(this.sendReportIncidentUseCase)
    : super(const ReportIncidentState());

  Future<void> sendReport({
    required String incidentType,
    required String severity,
    required String details,
  }) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final position = await getCurrentLocation();

      final report = ReportIncident(
        incidentType: incidentType,
        severity: severity,
        details: details,
        latitude: position.latitude,
        longitude: position.longitude,
        image: state.selectedImage,
      );

      await sendReportIncidentUseCase(report);

      state = state.copyWith(isLoading: false, isSubmitted: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
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
}
