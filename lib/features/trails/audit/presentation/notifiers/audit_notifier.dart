import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/Audit.dart';
import '../states/paginated_audit_state.dart';
import '../../domain/repositories/audit_repository.dart';
import '../../domain/usecases/get_audit_usecase.dart';

class AuditNotifier extends StateNotifier<PaginatedAuditState> {
  final GetAuditUseCase getAuditUseCase;

  AuditNotifier(this.getAuditUseCase)
      : super(PaginatedAuditState(
          audit: [],
          limit: 10,
          search: '',
          isLoading: false,
          hasMore: true,
        )) {
    loadInitial(search: '');
  }

  Future<void> loadInitial({required String search}) async {
    await _fetch(limit: state.limit, search: search);
  }

  Future<void> loadMore({required String search}) async {
    if (state.isLoading || !state.hasMore) return;

    final newLimit = state.limit + 10;
    await _fetch(limit: newLimit, search: search);
  }

  Future<void> _fetch({required int limit, String search = ''}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // ✅ Use the UseCase here instead of repository
      final data = await getAuditUseCase(limit: limit, search: search);

      state = state.copyWith(
        audit: data,
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
    state = PaginatedAuditState(audit: []); // reset state
    await _fetch(limit: 10);
  }
}
