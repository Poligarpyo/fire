import '../entities/trade.dart';

class CalculateTotalProfitUseCase {
  double call(List<Trade> trades) {
    return trades.fold(
      0.0,
      (sum, trade) => sum + trade.profit,
    );
  }
}
