import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({required String message});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No promotions available right now',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  final String message;

  const ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Failed to load promotions\n$message',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.redAccent),
      ),
    );
  }
}
