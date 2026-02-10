import '../../domain/entities/Audit.dart';

class PaginatedAuditState {
  final List<Audit> audit;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int limit;
  final String search;
  final bool hasMore;

  PaginatedAuditState({
    required this.audit,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.limit = 10,
    this.search = '',
    this.hasMore = true,
  });

  PaginatedAuditState copyWith({
    List<Audit>? audit,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? limit,
    String? search,
    bool? hasMore,
  }) {
    return PaginatedAuditState(
      audit: audit ?? this.audit,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      limit: limit ?? this.limit,
      search: search ?? this.search,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
