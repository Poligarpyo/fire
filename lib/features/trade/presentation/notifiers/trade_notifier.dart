import 'package:flutter_riverpod/flutter_riverpod.dart';

 
 
import '../../domain/usecases/calculate_total_profit_usecase.dart';
import '../states/paginated_trade_state.dart'; 
import '../../domain/usecases/get_trade_usecase.dart';

class TradeNotifier extends StateNotifier<PaginatedTradeState> {
  final GetTradeUseCase getTradeUseCase;
  final CalculateTotalProfitUseCase calculateTotalProfit;
  TradeNotifier(
    this.getTradeUseCase,
    this.calculateTotalProfit,
  ) : super(PaginatedTradeState(
          trade: [],
          limit: 10,
          search: '',
          isLoading: false,
          hasMore: true,
        )) {
    loadInitial(search: '');
  }
  // 👇 PUT IT HERE
  double get totalProfit =>
      calculateTotalProfit(state.trade);

  Future<void> loadInitial({required String search}) async {
    await fetch(limit: state.limit, search: search);
  }

  Future<void> loadMore({required String search}) async {
    if (state.isLoading || !state.hasMore) return;

    final newLimit = state.limit + 10;
    await fetch(limit: newLimit, search: search);
  }

  Future<void> fetch({required int limit, String search = ''}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // ✅ Use the UseCase here instead of repository
      final data = await getTradeUseCase(limit: limit, search: search);

      state = state.copyWith(
        trade: data,
        limit: limit,
        isLoading: false,
        hasMore: data.length == limit,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    state = PaginatedTradeState(trade: []); // reset state
    await fetch(limit: 10);
  }
}
