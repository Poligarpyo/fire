import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/promotion_provider.dart';
import '../widgets/PromotionCard.dart';
import '../widgets/EmptyState.dart'; 
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/PromotionCardSkeleton.dart';

class PromotionsScreen extends ConsumerStatefulWidget {
  const PromotionsScreen({super.key});

  @override
  ConsumerState<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends ConsumerState<PromotionsScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    try {
      await ref.read(promotionsProvider.future);
      _refreshController.refreshCompleted();
    } catch (_) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final promotionsAsync = ref.watch(promotionsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text(
          'Promotions',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: promotionsAsync.when(
        loading: () => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 3, // Skeleton placeholders
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, __) => const PromotionCardSkeleton(),
        ),
        error: (err, _) => ErrorState(message: err.toString()),
        data: (promotions) {
          if (promotions.isEmpty) {
            return const EmptyState(
              message: 'No promotions available right now.',
            );
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            enablePullDown: true,
            header: const WaterDropHeader(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: promotions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return PromotionCard(promotion: promotions[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
