import '../../../../core/services/connectivity_service.dart';
import '../../../../exceptions/no_internet_exception.dart';
import '../../domain/entities/report_incident.dart';
import '../../domain/repositories/report_incident_repository.dart';
import '../model/report_incident_model.dart';
import '../sources/report_incident_remote_source.dart';

class ReportIncidentRepositoryImpl implements ReportIncidentRepository {
  final ReportIncidentRemoteSource remoteDataSource;
  final ConnectivityService connectivity;

  ReportIncidentRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  @override
  Future<List<ReportIncident>> getReportIncident(
      {required int limit, String search = ''}) async {
    // Check internet first
    final isConnected = await connectivity.isConnected;
    if (!isConnected) {
      throw NoInternetException(); // <-- your custom exception
    }

    final models = await remoteDataSource.fetchReportIncident(limit: limit);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> sendReport(ReportIncident report) {
    return remoteDataSource.sendReport(report);
  }
}
