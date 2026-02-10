import '../entities/trade.dart';

abstract class TradeRepository {
  Future<List<Trade>> getTrade({required int limit, String search = ''});
}
