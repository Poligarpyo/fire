import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/connectivity_provider.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../data/repositories/report_incident_repository_impl.dart';
import '../../data/sources/report_incident_remote_source.dart';
import '../../domain/entities/report_incident.dart';
import '../../domain/repositories/report_incident_repository.dart';  
import '../../domain/usecases/set_report_incident_usecase.dart';
import '../notifiers/report_incident_notifier.dart';
import '../states/report_incident_state.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final reportIncidentRemoteSourceProvider =
    Provider<ReportIncidentRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  final authLocal = ref.read(authLocalDataSourceProvider);
  final networkRepository = ref.read(networkRepositoryProvider.notifier);

  return ReportIncidentRemoteSource(
      dio: dio,
      authLocalDataSource: authLocal,
      networkRepository: networkRepository);
});

final reportIncidentRepositoryProvider =
    Provider<ReportIncidentRepository>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  final remoteSource = ref
      .watch(reportIncidentRemoteSourceProvider); // ✅ Access remote API source

  return ReportIncidentRepositoryImpl(
    remoteDataSource: remoteSource,
    connectivity: connectivity, // ✅ Pass connectivity into your repository
  );
});

final sendReportIncidentUseCaseProvider =
    Provider<SendReportIncidentUseCase>((ref) {
  final repository = ref.read(reportIncidentRepositoryProvider);
  return SendReportIncidentUseCase(repository);
});

final reportIncidentNotifierProvider =
    StateNotifierProvider<ReportIncidentNotifier, ReportIncidentState>((ref) {
  final sendReportIncidentUseCase = ref.read(sendReportIncidentUseCaseProvider); 
  return ReportIncidentNotifier(sendReportIncidentUseCase);
});
