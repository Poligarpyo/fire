import '../../../../core/result/result.dart';
import '../entities/report_incident.dart';
import '../repositories/report_incident_repository.dart';
 

class SendReportIncidentUseCase {
  final ReportIncidentRepository repository;

  SendReportIncidentUseCase(this.repository);

  Future<Result<void>> call(ReportIncident report) {
    return repository.sendReport(report);
  }
}