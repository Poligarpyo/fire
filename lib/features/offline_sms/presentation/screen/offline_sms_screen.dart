import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/services/device_identifier_service.dart';
import '../../../../core/value_objects/phone_number.dart';
import '../../../authentication/presentation/widgets/custom_text_field.dart';
import '../../domain/entities/offline_sms.dart';
import '../../../../core/geolocator/getCurrentLocation.dart';
import '../providers/offline_sms_providers.dart';
import '../states/offline_sms_state.dart';
import 'telephony/sendEmergencySMS.dart';

class OfflineSmsScreen extends ConsumerStatefulWidget {
  const OfflineSmsScreen({super.key});

  @override
  ConsumerState<OfflineSmsScreen> createState() => _OfflineSmsScreenState();
}

class _OfflineSmsScreenState extends ConsumerState<OfflineSmsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final int maxCharacters = 160;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _messageController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _handleSendSMS() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(offlineSmsNotifierProvider.notifier)
          .handleEmergency(
            phone: _phoneNumberController.text.trim(),
            message: _messageController.text.trim(),
          );
    }
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final state = ref.watch(offlineSmsNotifierProvider);
    ref.listen<OfflineSmsState>(offlineSmsNotifierProvider, (previous, next) {
      if (next.success) {
        Navigator.pop(context);
        ref.read(offlineSmsNotifierProvider.notifier).resetStatus();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report saved. SMS sent successfully.'),
            backgroundColor: Colors.green,
          ),
        );
      }

      if (next.error != null) {
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            next.error!,
            style: const TextStyle(color: Colors.red, fontSize: 14),
          ),
        );
      }
    });
    return Dialog(
      backgroundColor: Colors.white, // ✅ force white
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
            // ✅ HEADER (fixed)
            _buildHeader(),

            // ✅ SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: _buildContent(state: state),
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
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFA726), Color(0xFFFF9800)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.message, color: Colors.white, size: 28),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Offline SMS Report',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: _handleCancel,
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildContent({required OfflineSmsState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Content
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Warning Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFB74D), width: 1),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFFF8F00),
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Offline Mode Active',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE65100),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Your report will be sent via SMS to BFP Emergency Hotline. Standard messaging rates may apply.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFE65100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // BFP Hotline Info
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BFP Hotline:',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Text(
                    '911',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // Message Label
              const Text(
                'Number to Send SMS',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 12),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 PHONE FIELD
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                      ),
                      child: CustomTextField(
                        controller: _phoneNumberController,
                        hintText: '912 345 6789',
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) {
                          final phone = value?.trim() ?? '';

                          if (phone.isEmpty) {
                            return "Phone number is required";
                          }

                          try {
                            PhoneNumber.parse(phone);
                            return null;
                          } catch (_) {
                            return "Invalid PH mobile number";
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 MESSAGE FIELD
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                        ),
                        child: TextFormField(
                          controller: _messageController,
                          maxLines: 5,
                          maxLength: maxCharacters,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryText,
                          ),
                          decoration: const InputDecoration(
                            hintText:
                                'FIRE EMERGENCY: Describe the fire situation, severity, number of people affected, and any obstacles for firefighters...',
                            hintStyle: TextStyle(
                              color: AppColors.hintText,
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                            counterText: '',
                          ),
                          onChanged: (value) => setState(() {}),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Message cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Character Counter and Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SMS will include: Location + Message',
                    style: TextStyle(fontSize: 11, color: AppColors.hintText),
                  ),
                  Text(
                    '${_messageController.text.length}/$maxCharacters',
                    style: TextStyle(
                      fontSize: 11,
                      color: _messageController.text.length > maxCharacters
                          ? Colors.red
                          : AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Action Buttons
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxWidth < 350;

                  if (isSmall) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state.isLoading ? null : _handleSendSMS,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF90A4AE),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.send, size: 18),
                                      SizedBox(width: 8),
                                      Text(
                                        'Send SMS Report',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: _handleCancel,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      // Send SMS Button
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state.isLoading ? null : _handleSendSMS,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF90A4AE),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.send, size: 18),
                                      SizedBox(width: 8),
                                      Text(
                                        'Send SMS Report',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            onPressed: _handleCancel,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),

              // Footer Note
              const Center(
                child: Text(
                  'SMS reports are processed immediately by BFP emergency system',
                  style: TextStyle(fontSize: 11, color: AppColors.hintText),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Helper function to show the dialog
void showOfflineSMSDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const OfflineSmsScreen(),
  );
}
