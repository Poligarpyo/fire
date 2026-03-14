import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../controllers/report_incident/notifier.dart';
import '../providers/report_incident_providers.dart';

class IncidentTypeSection extends ConsumerWidget {
  const IncidentTypeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Incident Type',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildIncidentTypeButton('Building Fire', ref),
            _buildIncidentTypeButton('Vehicle Fire', ref),
            _buildIncidentTypeButton('Forest Fire', ref),
            _buildIncidentTypeButton('Other Fire', ref),
          ],
        ),
      ],
    );
  }

  Widget _buildIncidentTypeButton(String type, WidgetRef ref) {
    final selectedType = ref.watch(reportIncidentNotifierProvider).incidentType;
    final isSelected = selectedType == type;

    return InkWell(
      onTap: () => ref
          .read(reportIncidentNotifierProvider.notifier)
          .setIncidentType(type),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryRed : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          type,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? AppColors.primaryRed : AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}
