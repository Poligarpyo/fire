import '../entities/trade.dart';
import '../repositories/trade_repository.dart';

class GetTradeUseCase {
  // Implementation goes here
  final TradeRepository repository;

  GetTradeUseCase(this.repository);

  Future<List<Trade>> call({required int limit, String search = ''}) {
    return repository.getTrade(limit: limit, search: search);
  }
}
