import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/geolocator/getCurrentLocation.dart';
import '../providers/report_incident_providers.dart';
import '../states/report_incident_state.dart';

class ReportIncidentScreen extends ConsumerStatefulWidget {
  const ReportIncidentScreen({super.key});

  @override
  ConsumerState<ReportIncidentScreen> createState() =>
      _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends ConsumerState<ReportIncidentScreen> {
  String selectedIncidentType = 'Building Fire';
  String selectedSeverity = 'Minor (Small fire, controllable)';
  final TextEditingController _detailsController = TextEditingController();
  File? selectedImage;

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  void _handleSendReport() {
    final message = _detailsController.text.trim();

    if (message.isEmpty) {
      _showError('Please enter a message');
      return;
    }

    ref.read(reportIncidentNotifierProvider.notifier).sendReport(
          incidentType: selectedIncidentType,
          severity: selectedSeverity,
          details: message,
          selectedImage: selectedImage,
        );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _handleOpenCamera() {
    ref.read(reportIncidentNotifierProvider.notifier).pickImage();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ReportIncidentState>(
      reportIncidentNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Report Sent"),
                content: const Text(
                    "Your emergency report has been sent successfully."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  )
                ],
              ),
            );
          },
        );
      },
    );

    final state = ref.watch(reportIncidentNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Red Header
            _buildHeader(),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    // Incident Type
                    _buildIncidentTypeSection(),

                    const SizedBox(height: 24),

                    // Severity Level
                    _buildSeveritySection(),

                    const SizedBox(height: 24),

                    // Capture Photo
                    _buildCapturePhotoSection(),

                    const SizedBox(height: 24),

                    // Additional Details
                    _buildAdditionalDetailsSection(),

                    const SizedBox(height: 32),

                    // Send Report Button
                    _buildSendButton(state),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryRed,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar with user info and icons
            Row(
              children: [
                // User Avatar
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),

                const SizedBox(width: 12),

                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Juan Dela Cruz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'USR-1P741AKHA',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Message Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                ),

                // Profile Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Title
            const Text(
              'Report Fire Incident',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // Subtitle
            const Text(
              'Your location is being tracked',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncidentTypeSection() {
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
            _buildIncidentTypeButton('Building Fire'),
            _buildIncidentTypeButton('Vehicle Fire'),
            _buildIncidentTypeButton('Forest Fire'),
            _buildIncidentTypeButton('Other Fire'),
          ],
        ),
      ],
    );
  }

  Widget _buildIncidentTypeButton(String type) {
    final isSelected = selectedIncidentType == type;

    return InkWell(
      onTap: () => setState(() => selectedIncidentType = type),
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

  Widget _buildSeveritySection() {
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
              items: [
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
                  setState(() => selectedSeverity = newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCapturePhotoSection() {
    final notifier = ref.watch(reportIncidentNotifierProvider.notifier);
    final image = notifier.selectedImage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null) ...[
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
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
          onTap: _handleOpenCamera,
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

                const Text(
                  'Tap to Open Camera',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),

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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
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
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.hintText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalDetailsSection() {
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
            controller: _detailsController,
            maxLines: 5,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.primaryText,
            ),
            decoration: const InputDecoration(
              hintText:
                  'Describe the situation, number of people affected, accessibility issues...',
              hintStyle: TextStyle(
                color: AppColors.hintText,
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSendButton(ReportIncidentState state) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: state.maybeWhen(
          loading: () => null,
          orElse: () => _handleSendReport,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
        ),
        child: state.when(
          initial: () => _buildButtonContent(),
          loading: () => const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          success: () => _buildButtonContent(),
          error: (_) => _buildButtonContent(),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.send,
          size: 22,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          'Send Emergency Report',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.white),
        ),
      ],
    );
  }
}

// Custom painter for map grid
class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..strokeWidth = 1;

    // Draw vertical lines
    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
