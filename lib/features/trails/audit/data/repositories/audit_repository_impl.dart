 
import '../../domain/entities/Audit.dart';
import '../../domain/repositories/audit_repository.dart';
import '../model/audit_model.dart';
import '../sources/audit_remote_source.dart';

class AuditRepositoryImpl implements AuditRepository {
  final AuditRemoteSource remoteDataSource;
  AuditRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<List<Audit>> getAudit({required int limit, String search = ''}) async {
    final models = await remoteDataSource.fetchAudit(limit: limit, search: search);
    return models.map((e) => e.toEntity()).toList();
  } 
}
