import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/additional_details_section.dart';
import '../widgets/capture_photo_section.dart';
import '../widgets/incident_type_section.dart';
import '../widgets/report_header.dart';
import '../widgets/report_incident_listener.dart';
import '../widgets/send_button.dart';
import '../widgets/severity_section.dart';

class ReportIncidentScreen extends ConsumerWidget {
  const ReportIncidentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ReportIncidentListener(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              ReportHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IncidentTypeSection(),
                      SizedBox(height: 24),
                      SeveritySection(),
                      SizedBox(height: 24),
                      CapturePhotoSection(),
                      SizedBox(height: 24),
                      AdditionalDetailsSection(),
                      SizedBox(height: 32),
                      SendButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
