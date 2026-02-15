 
 
import '../../entities/firetruck.dart';
import '../../repositories/firetruck_repository.dart';

class SendFireTruckUseCase {
  // Implementation goes here
  final FireTruckRepository repository;

  SendFireTruckUseCase(this.repository);

  // Future<List<FireTruck>> call({required int limit, String search = ''}) {
  //   return repository.getFireTruck(limit: limit, search: search);
  // }

  Future<void> call(FireTruck report) {
    return repository.sendReport(report);
  }
}
