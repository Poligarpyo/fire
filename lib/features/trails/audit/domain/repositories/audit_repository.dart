import '../entities/Audit.dart';

abstract class AuditRepository {
  Future<List<Audit>> getAudit({required int limit, String search = ''});
}
