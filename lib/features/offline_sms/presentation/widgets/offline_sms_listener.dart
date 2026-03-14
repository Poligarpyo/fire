import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/offline_sms/notifier.dart';
import '../controllers/offline_sms/state.dart'; 

class OfflineSmsListener extends ConsumerWidget {
  final Widget child;
  const OfflineSmsListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<OfflineSmsState>(offlineSmsNotifierProvider, (previous, next) {
      // Close dialog if flag is set
      if (next.shouldCloseDialog) {
        Navigator.pop(context);
        ref.read(offlineSmsNotifierProvider.notifier).resetCloseDialog();
      }

      // Show success message
      if (next.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report saved. SMS sent successfully.'),
            backgroundColor: Colors.green,
          ),
        );
      }

      // Show error message
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    // Simply return the child widget
    return child;
  }
}