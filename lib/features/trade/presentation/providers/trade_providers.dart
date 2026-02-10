import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/connectivity_provider.dart';
import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../../../data/repository/network_repository.dart';
import '../../data/repositories/trade_repository_impl.dart';
import '../../data/sources/trade_remote_source.dart';
import '../../domain/entities/trade.dart';
import '../../domain/usecases/calculate_total_profit_usecase.dart';
import '../states/paginated_trade_state.dart';
import '../../domain/repositories/trade_repository.dart';
import '../../domain/usecases/get_trade_usecase.dart';
import '../notifiers/trade_notifier.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final tradeRemoteSourceProvider = Provider<TradeRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  final authLocal = ref.read(authLocalDataSourceProvider);
  final networkRepository = ref.read(networkRepositoryProvider.notifier);

  return TradeRemoteSource(
      dio: dio,
      authLocalDataSource: authLocal,
      networkRepository: networkRepository);
});
final tradeRepositoryProvider = Provider<TradeRepository>((ref) {
  final connectivity =
      ref.watch(connectivityProvider);  
  final remoteSource =
      ref.watch(tradeRemoteSourceProvider); // ✅ Access remote API source

  return TradeRepositoryImpl(
    remoteDataSource: remoteSource,
    connectivity: connectivity, // ✅ Pass connectivity into your repository
  );
});
final getTradeUseCaseProvider = Provider<GetTradeUseCase>((ref) {
  final repository = ref.read(tradeRepositoryProvider);
  return GetTradeUseCase(repository);
});

final calculateTotalProfitUseCaseProvider =
    Provider<CalculateTotalProfitUseCase>((ref) {
  return CalculateTotalProfitUseCase();
});

final tradeProvider =
    StateNotifierProvider<TradeNotifier, PaginatedTradeState>((ref) {
  final getTradeUseCase = ref.read(getTradeUseCaseProvider);
  final calculateTotalProfit = ref.read(calculateTotalProfitUseCaseProvider);

  return TradeNotifier(
    getTradeUseCase,
    calculateTotalProfit,
  );
});
