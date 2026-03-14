import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../controllers/report_incident/notifier.dart';
import '../providers/report_incident_providers.dart';

class AdditionalDetailsSection extends ConsumerWidget {
  const AdditionalDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Details (Optional)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: TextField(
            onChanged: (value) {
              ref
                  .read(reportIncidentNotifierProvider.notifier)
                  .setDetails(value);
            },
            maxLines: 5,
            style: const TextStyle(fontSize: 15, color: AppColors.primaryText),
            decoration: const InputDecoration(
              hintText:
                  'Describe the situation, number of people affected, accessibility issues...',
              hintStyle: TextStyle(color: AppColors.hintText, fontSize: 14),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
