import 'package:flutter/widgets.dart';

import '../notifiers/trade_notifier.dart';
import '../states/paginated_trade_state.dart';
import 'OfflineCard.dart';
import 'TradeShimmer.dart';
import 'buildScaffold.dart';

Widget buildContent(
  PaginatedTradeState state,
  TradeNotifier notifier, {
  required bool isOnline,
  required ScrollController scrollController,
}) {
  if (!isOnline) {
    return OfflineCard(
      message: "You are offline. Check your connection.",
      onRetry: () => notifier.refresh(),
    );
  }

  if (state.isLoading && state.trade.isEmpty) {
    return const TradeShimmer();
  }

  if (state.error != null) {
    return OfflineCard(
      message: state.error!,
      onRetry: () => notifier.refresh(),
    );
  }

  if (state.trade.isEmpty) {
    return OfflineCard(
      message: "No trades found. Pull down to refresh.",
      onRetry: () => notifier.refresh(),
    );
  }

  return buildScaffold(state, notifier, scrollController);
}
