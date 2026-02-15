import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_incident_state.freezed.dart';

@freezed
class ReportIncidentState with _$ReportIncidentState {
  const factory ReportIncidentState.initial() = _Initial;
  const factory ReportIncidentState.loading() = _Loading;
  const factory ReportIncidentState.success() = _Success;
  const factory ReportIncidentState.error(String message) = _Error;
}
