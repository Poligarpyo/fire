import 'package:flutter/material.dart';

import '../../domain/entities/Account.dart';

class StatsGrid extends StatelessWidget {
  final Account account;

  const StatsGrid({required this.account});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      children: [
        _StatCard(
          title: 'Leverage',
          value: '1:${account.leverage}',
          icon: Icons.trending_up,
        ),
        _StatCard(
          title: 'Open Trades',
          value: account.currentTradesCount.toString(),
          icon: Icons.swap_horiz,
        ),
        _StatCard(
          title: 'Current Trades',
          value: account.currentTradesVolume.toString(),
          icon: Icons.swap_horiz,
        ),
        _StatCard(
          title: 'Total Trades Volume',
          value: account.totalTradesVolume.toString(),
          icon: Icons.swap_horiz,
        ),
        _StatCard(
          title: 'Total Trades',
          value: account.totalTradesCount.toString(),
          icon: Icons.history,
        ),
        _StatCard(
          title: 'Swap Free',
          value: account.isSwapFree ? 'Yes' : 'No',
          icon: Icons.security,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
