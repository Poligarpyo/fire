// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditModel _$AuditModelFromJson(Map<String, dynamic> json) => _AuditModel(
      trailId: (json['trail_id'] as num).toInt(),
      dateEntered: json['date_entered'] as String,
      dayOnly: json['day_only'] as String,
      month: json['month'] as String,
      year: json['year'] as String,
      activity: json['activity'] as String,
      actionDisplay: json['action_display'] as String,
      deptName: json['dept_name'] as String,
      empFname: json['emp_fname'] as String,
      empLname: json['emp_lname'] as String,
      empMname: json['emp_mname'] as String,
    );

Map<String, dynamic> _$AuditModelToJson(_AuditModel instance) =>
    <String, dynamic>{
      'trail_id': instance.trailId,
      'date_entered': instance.dateEntered,
      'day_only': instance.dayOnly,
      'month': instance.month,
      'year': instance.year,
      'activity': instance.activity,
      'action_display': instance.actionDisplay,
      'dept_name': instance.deptName,
      'emp_fname': instance.empFname,
      'emp_lname': instance.empLname,
      'emp_mname': instance.empMname,
    };
