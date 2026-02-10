import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
 
import '../../data/repositories/audit_repository_impl.dart';
import '../../data/sources/audit_remote_source.dart';
import '../../domain/entities/Audit.dart'; 
import '../states/paginated_audit_state.dart';
import '../../domain/repositories/audit_repository.dart';
import '../../domain/usecases/get_audit_usecase.dart';
import '../notifiers/audit_notifier.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final auditRemoteSourceProvider = Provider<AuditRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  return AuditRemoteSource(dio: dio);
});

final auditRepositoryProvider = Provider<AuditRepository>((ref) {
  return AuditRepositoryImpl(
    remoteDataSource: ref.read(auditRemoteSourceProvider),
  );
});

final getAuditUseCaseProvider = Provider<GetAuditUseCase>((ref) {
  final repository = ref.read(auditRepositoryProvider);
  return GetAuditUseCase(repository);
});
 

final auditProvider =
    StateNotifierProvider<AuditNotifier, PaginatedAuditState>(
  (ref) {
    final useCase = ref.read(getAuditUseCaseProvider);
    return AuditNotifier(useCase);
  },
);
