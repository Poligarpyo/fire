import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../domain/repositories/offline_sms_repository.dart';
import '../../../../core/value_objects/phone_number.dart';
import '../../../../core/geolocator/getCurrentLocation.dart';
import '../../domain/entities/offline_sms.dart';
import '../../domain/usecases/set_offline_sms_usecase.dart';
import '../../../../core/geolocator/getCurrentLocation.dart' as locationService;
import '../screen/telephony/sendEmergencySMS.dart';
import '../states/offline_sms_state.dart';

class OfflineSmsNotifier extends StateNotifier<OfflineSmsState> {
  final SendOfflineSmsUseCase useCase;
  final OfflineSmsRepository repository;

  OfflineSmsNotifier(this.useCase, this.repository)
    : super(OfflineSmsState.initial());

  Future<void> submitOfflineSms(OfflineSms sms) async {
    state = state.copyWith(isLoading: true);

    try {
      await useCase.execute(sms); // This calls repository.saveOffline()
      state = state.copyWith(isLoading: false, success: true);
      print("Offline SMS submitted successfully");
    } catch (e) {
      print("Error submitting offline SMS: $e");
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> handleEmergency({
    required String phone,
    required String message,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Optional: add a delay before processing
      await Future.delayed(const Duration(seconds: 1));

      final trimmedMessage = message.trim();
      if (trimmedMessage.isEmpty) throw Exception("Message cannot be empty");

      final phoneNumber = PhoneNumber.parse(phone);
      final position = await locationService.getCurrentLocation();

      final smsMessage =
          "$trimmedMessage\nLocation: ${position.latitude}, ${position.longitude}";

      final offlineSms = OfflineSms(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        message: smsMessage,
        latitude: position.latitude,
        longitude: position.longitude,
        sentViaSms: false,
        createdAt: DateTime.now(),
        phoneNumber: phoneNumber.value,
      );

      await useCase.execute(offlineSms);

      // Optional: delay to let user see “sending…”
      // ignore: always_specify_types, inference_failure_on_instance_creation
      await Future.delayed(const Duration(milliseconds: 500));

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void resetStatus() {
    state = state.copyWith(success: false, error: null);
  }
}
