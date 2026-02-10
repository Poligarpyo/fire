import '../../../../core/services/connectivity_service.dart';
import '../../../../exceptions/no_internet_exception.dart';
import '../../domain/entities/trade.dart';
import '../../domain/repositories/trade_repository.dart';
import '../model/trade_model.dart';
import '../sources/trade_remote_source.dart';

class TradeRepositoryImpl implements TradeRepository {
  final TradeRemoteSource remoteDataSource;
  final ConnectivityService connectivity;

  TradeRepositoryImpl({
    required this.remoteDataSource,
    required this.connectivity,
  });

  @override
  Future<List<Trade>> getTrade({required int limit, String search = ''}) async {
    // Check internet first
    final isConnected = await connectivity.isConnected;
    if (!isConnected) {
      throw NoInternetException(); // <-- your custom exception
    }

    final models = await remoteDataSource.fetchTrade(limit: limit);
    return models.map((e) => e.toEntity()).toList();
  }
}
