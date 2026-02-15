import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../widgets/geolocator/getCurrentLocation.dart';
import '../../domain/entities/report_incident.dart'; 
import '../../domain/usecases/set_report_incident_usecase.dart';
import '../states/report_incident_state.dart';

class ReportIncidentNotifier extends StateNotifier<ReportIncidentState> {
  final SendReportIncidentUseCase sendReportIncidentUseCase;

  ReportIncidentNotifier(this.sendReportIncidentUseCase)
      : super(const ReportIncidentState.initial());
  File? selectedImage;
  Future<void> sendReport({
    required String incidentType,
    required String severity,
    required String details,
    required File? selectedImage,
  }) async {
    try {
      state = const ReportIncidentState.loading();

      // 🔥 GPS automatically handled here
      final position = await getCurrentLocation();

      final report = ReportIncident(
        incidentType: incidentType,
        severity: severity,
        details: details,
        latitude: position.latitude,
        longitude: position.longitude,
        image: selectedImage,
      );

      await sendReportIncidentUseCase(report);

      state = const ReportIncidentState.success();
    } catch (e) {
      state = ReportIncidentState.error(e.toString());
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      state = const ReportIncidentState.initial();
    }
  }
}
