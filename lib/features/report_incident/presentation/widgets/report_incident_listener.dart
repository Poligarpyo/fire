import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/report_incident/notifier.dart';
import '../controllers/report_incident/state.dart'; 
import '../providers/report_incident_providers.dart';

class ReportIncidentListener extends ConsumerWidget {
  final Widget child; 
  const ReportIncidentListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ReportIncidentState>(reportIncidentNotifierProvider, (
      previous,
      next,
    ) {
      // 🔴 Error Snackbar
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }

      // ✅ Success Dialog
      if (next.isSubmitted && previous?.isSubmitted != true) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Report Sent"),
            content: const Text(
              "Your emergency report has been sent successfully.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });

    return child;
  }
}
