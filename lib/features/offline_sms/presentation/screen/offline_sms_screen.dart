import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../core/value_objects/phone_number.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';
import '../controllers/offline_sms/notifier.dart';
import '../controllers/offline_sms/state.dart';
import '../providers/offline_sms_providers.dart';
import '../widgets/content.dart';
import '../widgets/header_sms_offline.dart';
import '../widgets/offline_sms_listener.dart';

class OfflineSmsScreen extends ConsumerWidget {
  const OfflineSmsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size; 
    return OfflineSmsListener(
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.9,
            maxWidth: size.width > 600 ? 500 : size.width,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderSmsOffline(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Content(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
