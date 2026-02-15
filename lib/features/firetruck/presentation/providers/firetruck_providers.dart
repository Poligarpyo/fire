import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/connectivity_provider.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../data/repositories/firetruck_repository_impl.dart';
import '../../data/sources/firetruck_remote_source.dart';
import '../../domain/entities/firetruck.dart';
import '../../domain/repositories/firetruck_repository.dart';   
import '../../domain/usecases/usecases/get_firetruck_usecase.dart';
import '../notifiers/firetruck_notifier.dart';
import '../states/firetruck_state.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final fireTruckRemoteSourceProvider =
    Provider<FireTruckRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  final authLocal = ref.read(authLocalDataSourceProvider);
  final networkRepository = ref.read(networkRepositoryProvider.notifier);

  return FireTruckRemoteSource(
      dio: dio,
      authLocalDataSource: authLocal,
      networkRepository: networkRepository);
});

final fireTruckRepositoryProvider =
    Provider<FireTruckRepository>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  final remoteSource = ref
      .watch(fireTruckRemoteSourceProvider); // ✅ Access remote API source

  return FireTruckRepositoryImpl(
    remoteDataSource: remoteSource,
    connectivity: connectivity, // ✅ Pass connectivity into your repository
  );
});

final sendFireTruckUseCaseProvider =
    Provider<SendFireTruckUseCase>((ref) {
  final repository = ref.read(fireTruckRepositoryProvider);
  return SendFireTruckUseCase(repository);
});

final fireTruckNotifierProvider =
    StateNotifierProvider<FireTruckNotifier, FireTruckState>((ref) {
  final sendFireTruckUseCase = ref.read(sendFireTruckUseCaseProvider); 
  return FireTruckNotifier(sendFireTruckUseCase);
});
