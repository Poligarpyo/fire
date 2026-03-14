import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../controllers/report_incident/notifier.dart';
import '../providers/report_incident_providers.dart';

class CapturePhotoSection extends ConsumerWidget {
  const CapturePhotoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportIncidentNotifierProvider);
    final notifier = ref.read(reportIncidentNotifierProvider.notifier);

    final image = state.selectedImage;

    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.camera_alt, color: AppColors.primaryRed, size: 22),
            SizedBox(width: 8),
            Text(
              'Capture Photo Evidence',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: notifier.pickImage,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                // Camera Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: AppColors.primaryRed,
                  ),
                ),

                const SizedBox(height: 16),

                if (image != null) ...[
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Delete button on top-right corner
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: notifier.removeImage,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const Text(
                    'Tap to Open Camera',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],

                const SizedBox(height: 8),

                const Text(
                  'Take a photo of the fire incident',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),

                const SizedBox(height: 16),

                // Info Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.camera, color: Colors.blue, size: 16),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Device camera will open',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: Colors.blue, size: 16),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'GPS coordinates will be embedded automatically',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  '* Camera access required. Photo will include location metadata.',
                  style: TextStyle(fontSize: 11, color: AppColors.hintText),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
