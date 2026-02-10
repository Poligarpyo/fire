import '../../domain/entities/trade.dart';

class PaginatedTradeState {
  final List<Trade> trade;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int limit;
  final String search;
  final bool hasMore;

  PaginatedTradeState({
    required this.trade,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.limit = 10,
    this.search = '',
    this.hasMore = true,
  });

  PaginatedTradeState copyWith({
    List<Trade>? trade,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? limit,
    String? search,
    bool? hasMore,
  }) {
    return PaginatedTradeState(
      trade: trade ?? this.trade,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      limit: limit ?? this.limit,
      search: search ?? this.search,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
