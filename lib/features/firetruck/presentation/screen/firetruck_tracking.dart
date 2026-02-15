import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../../constants/app_colors.dart';
import '../../../../router/app_router.dart';
import '../../../report_incident/presentation/screen/report_incident.dart';

class FireTruckTrackingScreen extends StatefulWidget {
  const FireTruckTrackingScreen({super.key});

  @override
  State<FireTruckTrackingScreen> createState() =>
      _FireTruckTrackingScreenState();
}

class _FireTruckTrackingScreenState extends State<FireTruckTrackingScreen> {
  // Mock data - replace with real tracking data
  String truckStatus = 'En Route';
  String estimatedTime = '5 mins';
  double distanceKm = 2.3;
  String truckId = 'FT-2024-001';
  String respondingStation = 'Manila Central Fire Station';
  int crewMembers = 6;
  String driverName = 'Officer Juan Santos';

  // Route progress (0.0 to 1.0)
  double routeProgress = 0.35;

  Timer? _progressTimer;

  @override
  void initState() {
    super.initState();
    _startProgressSimulation();
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  void _startProgressSimulation() {
    // Simulate progress for demo
    _progressTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          routeProgress += 0.05;
          if (routeProgress >= 1.0) {
            routeProgress = 1.0;
            truckStatus = 'Arrived';
            timer.cancel();
          } else {
            // Update ETA
            int mins = ((1.0 - routeProgress) * 14).round();
            estimatedTime = '$mins mins';
            distanceKm =
                double.parse(((1.0 - routeProgress) * 6.5).toStringAsFixed(1));
          }
        });
      }
    });
  }

  void _handleCallStation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Calling fire station...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _handleEmergencyContact() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Calling 911...'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Map Area with Route
                    _buildMapArea(),

                    // Status Cards
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // ETA Card
                          _buildETACard(),

                          const SizedBox(height: 16),

                          // Truck Details Card
                          _buildTruckDetailsCard(),

                          const SizedBox(height: 16),

                          // Progress Timeline
                          _buildProgressTimeline(),

                          const SizedBox(height: 16),

                          // Crew Information
                          _buildCrewCard(),

                          const SizedBox(height: 16),

                          // Action Buttons
                          _buildActionButtons(),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
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
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button and title
            Row(
              children: [
                IconButton(
                  onPressed: () => context.go(SGRoute.home.route),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Fire Truck Tracking',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Real-time location monitoring',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // Emergency call button
                IconButton(
                  onPressed: _handleEmergencyContact,
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapArea() {
    return Container(
      height: 300,
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      child: Stack(
        children: [
          // Map grid background
          CustomPaint(
            size: const Size(double.infinity, 300),
            painter: MapGridPainter(),
          ),

          // Route line
          CustomPaint(
            size: const Size(double.infinity, 300),
            painter: RouteLinePainter(progress: routeProgress),
          ),

          // Starting point (Fire Station)
          Positioned(
            left: 50,
            top: 50,
            child: _buildMapMarker(
              icon: Icons.location_city,
              color: Colors.blue,
              label: 'Fire Station',
            ),
          ),

          // Fire Truck (moving)
          Positioned(
            left:
                50 + (MediaQuery.of(context).size.width - 150) * routeProgress,
            top: 50 + (200) * routeProgress,
            child: _buildMapMarker(
              icon: Icons.local_fire_department,
              color: AppColors.primaryRed,
              label: 'Fire Truck',
              isAnimated: true,
            ),
          ),

          // Destination (Your Location)
          Positioned(
            right: 50,
            bottom: 50,
            child: _buildMapMarker(
              icon: Icons.flag,
              color: Colors.orange,
              label: 'Your Location',
            ),
          ),

          // Status Badge
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: truckStatus == 'Arrived'
                    ? Colors.green
                    : AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    truckStatus == 'Arrived'
                        ? Icons.check_circle
                        : Icons.local_shipping,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    truckStatus,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapMarker({
    required IconData icon,
    required Color color,
    required String label,
    bool isAnimated = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: isAnimated ? 12 : 8,
                spreadRadius: isAnimated ? 4 : 2,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildETACard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD32F2F), Color(0xFFB71C1C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryRed.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Estimated Arrival',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        estimatedTime,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Distance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$distanceKm km',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: routeProgress,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '${(routeProgress * 100).toStringAsFixed(0)}% of journey completed',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTruckDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.local_fire_department,
                color: AppColors.primaryRed,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Fire Truck Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            icon: Icons.local_shipping,
            label: 'Truck ID',
            value: truckId,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            icon: Icons.business,
            label: 'Station',
            value: respondingStation,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            icon: Icons.group,
            label: 'Crew Members',
            value: '$crewMembers firefighters',
          ),
          const Divider(height: 24),
          _buildDetailRow(
            icon: Icons.person,
            label: 'Driver',
            value: driverName,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryRed.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryRed,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressTimeline() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Journey Progress',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 20),
          _buildTimelineItem(
            icon: Icons.check_circle,
            title: 'Dispatch Confirmed',
            time: '2 mins ago',
            isCompleted: true,
          ),
          _buildTimelineItem(
            icon: Icons.local_shipping,
            title: 'Truck En Route',
            time: 'Current',
            isCompleted: routeProgress > 0.3,
            isCurrent: routeProgress <= 0.9,
          ),
          _buildTimelineItem(
            icon: Icons.location_on,
            title: 'Arriving at Scene',
            time: estimatedTime,
            isCompleted: routeProgress >= 1.0,
            isCurrent: routeProgress > 0.9 && routeProgress < 1.0,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String time,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isLast = false,
  }) {
    final color = isCompleted
        ? Colors.green
        : isCurrent
            ? AppColors.primaryOrange
            : AppColors.hintText;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: color.withOpacity(0.3),
                margin: const EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isCompleted || isCurrent
                        ? AppColors.primaryText
                        : AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCrewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange.withOpacity(0.1),
            AppColors.primaryOrange.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryOrange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.info_outline,
                color: AppColors.primaryOrange,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Emergency Response Team',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'A team of 6 trained firefighters with full emergency equipment is on the way. They are equipped to handle building fires and rescue operations.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.secondaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Call Station Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _handleCallStation,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.phone),
            label: const Text(
              'Call Fire Station',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Emergency Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: _handleEmergencyContact,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryRed,
              side: const BorderSide(color: AppColors.primaryRed, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.emergency),
            label: const Text(
              'Emergency Contact: 911',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom painter for route line
class RouteLinePainter extends CustomPainter {
  final double progress;

  RouteLinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF9800)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dashPaint = Paint()
      ..color = const Color(0xFFFF9800).withOpacity(0.3)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw route path
    final startPoint = Offset(50 + 24, 50 + 24);
    final endPoint = Offset(size.width - 50 - 24, size.height - 50 - 24);

    // Current progress point
    final currentPoint = Offset(
      startPoint.dx + (endPoint.dx - startPoint.dx) * progress,
      startPoint.dy + (endPoint.dy - startPoint.dy) * progress,
    );

    // Draw completed path (solid)
    canvas.drawLine(startPoint, currentPoint, paint);

    // Draw remaining path (dashed)
    _drawDashedLine(canvas, currentPoint, endPoint, dashPaint);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dashWidth = 10;
    const dashSpace = 5;
    final distance = (end - start).distance;
    final dashCount = (distance / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      final startFraction = (i * (dashWidth + dashSpace)) / distance;
      final endFraction =
          ((i * (dashWidth + dashSpace)) + dashWidth) / distance;

      final dashStart = Offset(
        start.dx + (end.dx - start.dx) * startFraction,
        start.dy + (end.dy - start.dy) * startFraction,
      );

      final dashEnd = Offset(
        start.dx + (end.dx - start.dx) * endFraction,
        start.dy + (end.dy - start.dy) * endFraction,
      );

      canvas.drawLine(dashStart, dashEnd, paint);
    }
  }

  @override
  bool shouldRepaint(RouteLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
