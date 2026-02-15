import '../entities/firetruck.dart';

abstract class FireTruckRepository {
  Future<List<FireTruck>> getFireTruck(
      {required int limit, String search = ''});

  Future<void> sendReport(FireTruck report);
}
