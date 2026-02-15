import '../../../../core/services/connectivity_service.dart';
import '../../../../exceptions/no_internet_exception.dart';
import '../../domain/entities/firetruck.dart';
import '../../domain/repositories/firetruck_repository.dart';
import '../model/firetruck_model.dart';
import '../sources/firetruck_remote_source.dart';

class FireTruckRepositoryImpl implements FireTruckRepository {
  final FireTruckRemoteSource remoteDataSource;
  final ConnectivityService connectivity;

  FireTruckRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  @override
  Future<List<FireTruck>> getFireTruck(
      {required int limit, String search = ''}) async {
    // Check internet first
    final isConnected = await connectivity.isConnected;
    if (!isConnected) {
      throw NoInternetException(); // <-- your custom exception
    }

    final models = await remoteDataSource.fetchFireTruck(limit: limit);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> sendReport(FireTruck report) {
    return remoteDataSource.sendReport(report);
  }
}
