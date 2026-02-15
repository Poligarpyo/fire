import '../entities/report_incident.dart';

abstract class ReportIncidentRepository {
  Future<List<ReportIncident>> getReportIncident(
      {required int limit, String search = ''});

  Future<void> sendReport(ReportIncident report);
}
