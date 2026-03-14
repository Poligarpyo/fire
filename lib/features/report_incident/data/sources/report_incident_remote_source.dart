import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../shared/constants/dio_helper.dart';
import '../../../../shared/constants/endpoints.dart';
import '../../../../core/storage/auth_local_datasource.dart';
import '../../../../data/app/app_initializer.dart';
import '../../../../data/repository/network_repository.dart';
import '../../../../exceptions/network_exceptions.dart';
import '../../domain/entities/report_incident.dart';
import '../models/report_incident_model.dart';

class ReportIncidentRemoteSource {
  final Dio dio;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkRepository networkRepository;
  ReportIncidentRemoteSource({
    required this.dio,
    required this.authLocalDataSource,
    required this.networkRepository,
  });

 
  Future<void> sendReport(ReportIncident report) async {
    try {
      // Create form data
      Map<String, dynamic> data = {
        "incident_type": report.incidentType,
        "severity": report.severity,
        "details": report.details,
        "latitude": report.latitude,
        "longitude": report.longitude,
      };

      // If image exists, add as MultipartFile
      if (report.image != null) {
        data["photo"] = await MultipartFile.fromFile(
          report.image!.path,
          filename: basename(report.image!.path),
        );
      }

      FormData formData = FormData.fromMap(data);

      // Send request
      final Response response = await networkRepository.state.post(
        '${Endpoints.exampleReportIncident}',
        data: formData,
      );

      // Optional: check response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Report sent successfully");
      } else {
        print("Failed to send report: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending report: $e");
    }
  }
}
