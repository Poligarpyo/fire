import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repositories/offline_sms_repository.dart';
import '../../../../../core/value_objects/phone_number.dart';
import '../../../domain/entities/offline_sms.dart';
import '../../../domain/usecases/set_offline_sms_usecase.dart';
import '../../../../../core/geolocator/getCurrentLocation.dart'
    as locationService;
import '../../providers/offline_sms_providers.dart';
import 'state.dart';

final offlineSmsNotifierProvider =
    StateNotifierProvider<OfflineSmsNotifier, OfflineSmsState>((ref) {
      final sendOfflineSmsUseCase = ref.read(sendOfflineSmsUseCaseProvider);
      return OfflineSmsNotifier(
        sendOfflineSmsUseCase,
        ref.read(offlineSmsRepositoryProvider),
      );
    });

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

  Future<void> handleEmergency() async {
    final currentState = state;

    state = state.copyWith(isLoading: true, error: null);

    try {
      // Optional: add a delay before processing
      await Future.delayed(const Duration(seconds: 1));

      final trimmedMessage = currentState.message;
      if (trimmedMessage.isEmpty) throw Exception("Message cannot be empty");

      final phoneNumber = PhoneNumber.parse(currentState.phone);
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

 
      await Future.delayed(const Duration(milliseconds: 500));

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void resetStatus() {
    state = state.copyWith(success: false, error: null);
  }

  void updateMessage(String message) {
    state = state.copyWith(message: message);
  }

  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void updateMaxCharacters(int maxCharacters) {
    state = state.copyWith(maxCharacters: maxCharacters);
  }

  void cancel() {
    state = state.copyWith(shouldCloseDialog: true);
  }

  void resetCloseDialog() {
    state = state.copyWith(shouldCloseDialog: false);
  }
}
