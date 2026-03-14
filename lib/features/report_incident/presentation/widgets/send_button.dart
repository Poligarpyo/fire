import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../controllers/report_incident/notifier.dart';
import '../providers/report_incident_providers.dart';

class SendButton extends ConsumerWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportIncidentNotifierProvider);
    final notifier = ref.read(reportIncidentNotifierProvider.notifier);
    final isLoading = state.isLoading;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : notifier.sendReport,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryRed),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loading'),
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : _buildButtonContent(),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.send, size: 22, color: Colors.white),
        SizedBox(width: 10),
        Text(
          'Send Emergency Report',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
