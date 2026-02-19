import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:telephony/telephony.dart';

import '../../../../core/database/database_providers.dart';
import '../../../../core/provider/connectivity_provider.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../data/repositories/offline_sms_repository_impl.dart';
import '../../data/sources/offline_sms_remote_source.dart';
import '../../domain/entities/offline_sms.dart';
import '../../domain/repositories/offline_sms_repository.dart';
import '../../domain/usecases/set_offline_sms_usecase.dart';
import '../notifiers/offline_sms_notifier.dart';
import '../states/offline_sms_state.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final offlineSmsRemoteSourceProvider = Provider<OfflineSmsRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  final authLocal = ref.read(authLocalDataSourceProvider);

  return OfflineSmsRemoteSource(dio: dio, authLocalDataSource: authLocal);
});

final offlineSmsRepositoryProvider = Provider<OfflineSmsRepository>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  final remoteSource = ref.watch(offlineSmsRemoteSourceProvider);
  final database = ref.watch(appDatabaseProvider);

  return OfflineSmsRepositoryImpl(
    database: database,
    remoteDataSource: remoteSource,
    connectivity: connectivity,
    telephony: Telephony.instance, // ✅ FIXED
  );
});

final sendOfflineSmsUseCaseProvider = Provider<SendOfflineSmsUseCase>((ref) {
  final repository = ref.read(offlineSmsRepositoryProvider);
  return SendOfflineSmsUseCase(repository);
});

final offlineSmsNotifierProvider =
    StateNotifierProvider<OfflineSmsNotifier, OfflineSmsState>((ref) {
      final sendOfflineSmsUseCase = ref.read(sendOfflineSmsUseCaseProvider);
      return OfflineSmsNotifier(
        sendOfflineSmsUseCase,
        ref.read(offlineSmsRepositoryProvider),
      );
    });
