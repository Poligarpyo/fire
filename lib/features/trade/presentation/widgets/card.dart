import 'package:flutter/material.dart';
import '../../domain/entities/trade.dart';

class TradeCard extends StatelessWidget {
  final Trade trade;

  const TradeCard({super.key, required this.trade});

  @override
  Widget build(BuildContext context) {
    final profitColor = trade.profit >= 0 ? Colors.greenAccent[400] : Colors.redAccent[400];
    final typeColor = trade.type == 0 ? Colors.greenAccent[100] : Colors.redAccent[100];
    final typeTextColor = trade.type == 0 ? Colors.green[800] : Colors.red[800];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Row: Symbol + Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trade.symbol,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: typeColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  trade.type == 0 ? 'BUY' : 'SELL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: typeTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 🔹 Price & Profit Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoTile('Open', trade.openPrice.toString(), icon: Icons.arrow_upward),
              _infoTile('Current', trade.currentPrice.toString(), icon: Icons.show_chart),
              _infoTile('Profit', trade.profit.toString(), icon: Icons.attach_money, valueColor: profitColor),
            ],
          ),

          const SizedBox(height: 16),

          // 🔹 Details Grid (Volume, Ticket, TP, SL, Digits)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _detailChip('Volume', trade.volume.toString()),
              _detailChip('Ticket', trade.ticket.toString()),
              _detailChip('TP', trade.tp.toStringAsFixed(2)),
              _detailChip('SL', trade.sl.toStringAsFixed(2)),
              _detailChip('Digits', trade.digits.toString()),
              _detailChip('Opened', trade.openTime.toString().substring(0, 16)),
            ],
          ),

          // 🔹 Optional Comment
          if (trade.comment != null && trade.comment!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                '💬 ${trade.comment}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value, {Color? valueColor, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null)
              Icon(icon, size: 16, color: Colors.grey[400]),
            if (icon != null) const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _detailChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
