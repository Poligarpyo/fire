import 'package:freezed_annotation/freezed_annotation.dart';

part 'firetruck_state.freezed.dart';

@freezed
class FireTruckState with _$FireTruckState {
  const factory FireTruckState.initial() = _Initial;
  const factory FireTruckState.loading() = _Loading;
  const factory FireTruckState.success() = _Success;
  const factory FireTruckState.error(String message) = _Error;
}
