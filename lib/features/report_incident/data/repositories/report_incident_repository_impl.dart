import '../../../../core/result/app_failure.dart'; 
import '../../../../core/result/result.dart'; 
import '../../../../core/services/connectivity_service.dart';
import '../../../../exceptions/no_internet_exception.dart';
import '../../domain/entities/report_incident.dart';
import '../../domain/repositories/report_incident_repository.dart';
import '../models/report_incident_model.dart';
import '../sources/report_incident_remote_source.dart';

class ReportIncidentRepositoryImpl implements ReportIncidentRepository {
  final ReportIncidentRemoteSource remoteDataSource;
  final ConnectivityService connectivity;

  ReportIncidentRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });
  
  @override
  Future<Result<void>> sendReport(ReportIncident report) async {
    try {
      await remoteDataSource.sendReport(report);
      return const Success(null);
    } catch (e) {
      return Failure(AppFailure(message: e.toString()));
    }
  }
}
