import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/app_bar_gone.dart';
import '../notifiers/trade_notifier.dart';
import '../states/paginated_trade_state.dart';
import 'card.dart';

Widget buildScaffold(
  PaginatedTradeState state,
  TradeNotifier notifier,
  ScrollController scrollController,
) {
  return Scaffold(
    backgroundColor: const Color(0xFFF6F7FB),
    appBar: EmptyAppBar(),
    body: RefreshIndicator(
      onRefresh: notifier.refresh,
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          /// 🔹 Profit Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5B8DEF),
                      Color(0xFF6F6AF8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Profit',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notifier.totalProfit.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🔹 Trade List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == state.trade.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TradeCard(
                      trade: state.trade[index],
                    ),
                  );
                },
                childCount: state.trade.length + (state.isLoading ? 1 : 0),
              ),
            ),
          ),

          /// 🔹 Bottom breathing space
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    ),
  );
}
