import '../entities/report_incident.dart';
import '../repositories/report_incident_repository.dart';

class SendReportIncidentUseCase {
  // Implementation goes here
  final ReportIncidentRepository repository;

  SendReportIncidentUseCase(this.repository);

  // Future<List<ReportIncident>> call({required int limit, String search = ''}) {
  //   return repository.getReportIncident(limit: limit, search: search);
  // }

  Future<void> call(ReportIncident report) {
    return repository.sendReport(report);
  }
}
