import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class OfflineSmsState with _$OfflineSmsState {
  const factory OfflineSmsState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    @Default('') String message,
    @Default('') String phone,
    @Default(160) int maxCharacters,
    String? error,
    @Default(false) bool shouldCloseDialog,
  }) = _OfflineSmsState;

  factory OfflineSmsState.initial() => const OfflineSmsState();
}
