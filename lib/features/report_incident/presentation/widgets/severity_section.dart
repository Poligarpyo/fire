import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../controllers/report_incident/notifier.dart';
import '../providers/report_incident_providers.dart';

class SeveritySection extends ConsumerWidget {
  const SeveritySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeverity = ref.watch(reportIncidentNotifierProvider).severity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Severity Level',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSeverity,
              isExpanded: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              borderRadius: BorderRadius.circular(12),
              items:
                  [
                    'Minor (Small fire, controllable)',
                    'Moderate (Medium fire, spreading)',
                    'Major (Large fire, uncontrollable)',
                    'Critical (Life threatening)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryText,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  ref
                      .read(reportIncidentNotifierProvider.notifier)
                      .setSeverity(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
