import '../entities/Audit.dart';
import '../repositories/audit_repository.dart';

class GetAuditUseCase {
  // Implementation goes here
  final AuditRepository repository;

  GetAuditUseCase(this.repository);

  Future<List<Audit>> call({required int limit, String search = ''}) {
    return repository.getAudit(limit: limit, search: search);
  }
}
