// features/trade/presentation/widgets/offline_card.dart
import 'package:flutter/material.dart';

class OfflineCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const OfflineCard({
    super.key,
    required this.onRetry,
    this.message = "No Internet Connection",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off, size: 64, color: Colors.orangeAccent),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("Retry"),
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
