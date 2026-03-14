import '../../../../core/result/result.dart';
import '../entities/report_incident.dart';

abstract class ReportIncidentRepository { 
  Future<Result<void>> sendReport(ReportIncident report);
}
