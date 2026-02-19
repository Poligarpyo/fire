import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_sms_state.freezed.dart';

@freezed
abstract class OfflineSmsState with _$OfflineSmsState {
  const factory OfflineSmsState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    String? error,
  }) = _OfflineSmsState;

  factory OfflineSmsState.initial() => const OfflineSmsState();
}
