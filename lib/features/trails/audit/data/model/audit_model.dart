import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/Audit.dart';

part 'audit_model.freezed.dart';
part 'audit_model.g.dart';

@freezed
abstract class AuditModel with _$AuditModel {
  const factory AuditModel({
    @JsonKey(name: 'trail_id') required int trailId,
    @JsonKey(name: 'date_entered') required String dateEntered,
    @JsonKey(name: 'day_only') required String dayOnly,
    @JsonKey(name: 'month') required String month,
    @JsonKey(name: 'year') required String year,
    @JsonKey(name: 'activity') required String activity,
    @JsonKey(name: 'action_display') required String actionDisplay,
    @JsonKey(name: 'dept_name') required String deptName,
    @JsonKey(name: 'emp_fname') required String empFname,
    @JsonKey(name: 'emp_lname') required String empLname,
    @JsonKey(name: 'emp_mname') required String empMname,
  }) = _AuditModel;

  factory AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);
}

extension AuditModelX on AuditModel {
  // Convert AuditModel to Audit entity
  Audit toEntity() => Audit(
        trailId: trailId,
        dateEntered: dateEntered,
        dayOnly: dayOnly,
        month: month,
        year: year,
        activity: activity,
        actionDisplay: actionDisplay,
        deptName: deptName,
        empFname: empFname,
        empLname: empLname,
        empMname: empMname,
      );
}
