import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/value_objects/phone_number.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/widgets/custom_text_area_field.dart';
import '../../../../shared/widgets/custom_text_form_field.dart'; 
import '../controllers/offline_sms/notifier.dart';

class Content extends ConsumerWidget {
  Content({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(offlineSmsNotifierProvider.notifier);

    // ✅ Only watch what is necessary
    final isLoading = ref.watch(
      offlineSmsNotifierProvider.select((s) => s.isLoading),
    );

    final messageLength = ref.watch(
      offlineSmsNotifierProvider.select((s) => s.message.length),
    );

    final maxCharacters = ref.watch(
      offlineSmsNotifierProvider.select((s) => s.maxCharacters),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= WARNING =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFB74D)),
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
                      child: Text(
                        'Offline Mode Active\n'
                        'Your report will be sent via SMS to BFP Emergency Hotline.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFE65100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= FORM =================
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 PHONE FIELD
                    CustomTextFormField(
                      onChanged: notifier.updatePhone,
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

                    const SizedBox(height: 20),

                    // 🔹 MESSAGE FIELD
                    CustomTextAreaField(
                      onChanged: notifier.updateMessage,
                      maxLines: 5,
                      maxLength: maxCharacters,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Message cannot be empty";
                        }
                        return null;
                      },
                      hintText:
                          'FIRE EMERGENCY: Describe the fire situation...',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // ================= COUNTER =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SMS will include: Location + Message',
                    style: TextStyle(fontSize: 11, color: AppColors.hintText),
                  ),
                  Text(
                    '$messageLength/$maxCharacters',
                    style: TextStyle(
                      fontSize: 11,
                      color: messageLength > maxCharacters
                          ? Colors.red
                          : AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ================= BUTTON =================
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            notifier.handleEmergency();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90A4AE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Send SMS Report',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: notifier.cancel,
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
