import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/app_bar_gone.dart';
import '../../../../core/provider/connectivity_provider.dart';
import '../../../authentication/domain/auth/auth_controller.dart';
import '../../domain/entities/trade.dart';
import '../providers/trade_providers.dart';
import '../widgets/OfflineCard.dart';
import '../widgets/TradeShimmer.dart';
import '../widgets/buildContent.dart';
import '../widgets/card.dart';

class TradeScreen extends ConsumerStatefulWidget {
  const TradeScreen({super.key});

  @override
  ConsumerState<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends ConsumerState<TradeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool _isWaitingToLoadMore = false;
  Timer? _loadMoreTimer;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (_isWaitingToLoadMore) return;
        if (_loadMoreTimer?.isActive ?? false) return;

        _loadMoreTimer = Timer(const Duration(seconds: 2), () {
          ref
              .read(tradeProvider.notifier)
              .loadMore(search: _searchController.text);
        });
      }
    });
  }

  @override
  void dispose() {
    _loadMoreTimer?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tradeProvider);
    final notifier = ref.watch(tradeProvider.notifier);
    final connectivityAsync = ref.watch(connectivityStatusProvider);

    ref.listen(connectivityStatusProvider, (_, next) {
      next.whenData((isOnline) {
        if (isOnline) {
          ref.read(tradeProvider.notifier).refresh();
        }
      });
    });

    return connectivityAsync.when(
      loading: () => buildContent(
        state,
        notifier,
        isOnline: true,
        scrollController: _scrollController,
      ),
      error: (_, __) => buildContent(
        state,
        notifier,
        isOnline: false,
        scrollController: _scrollController,
      ),
      data: (isOnline) => buildContent(
        state,
        notifier,
        isOnline: isOnline,
        scrollController: _scrollController,
      ),
    );
  }
}
