import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/offline_sms.dart';

part 'offline_sms_model.freezed.dart';
part 'offline_sms_model.g.dart';

@freezed
abstract class OfflineSmsModel with _$OfflineSmsModel {
  const OfflineSmsModel._();

  const factory OfflineSmsModel({
    required String id,
    required String message,
    required String phoneNumber, // Add this field 
    required double latitude,
    required double longitude,
    @Default(false) bool sentViaSms,
    @Default(0) int syncStatus,
    DateTime? createdAt,
  }) = _OfflineSmsModel;

  factory OfflineSmsModel.fromJson(Map<String, dynamic> json) =>
      _$OfflineSmsModelFromJson(json);
}

extension OfflineSmsModelX on OfflineSmsModel {
  // Convert OfflineSmsModel to OfflineSms Entity
  OfflineSms toEntity() => OfflineSms(
    id: id,
    message: message, 
    phoneNumber: phoneNumber,
    latitude: latitude,
    longitude: longitude,
    sentViaSms: sentViaSms,
    syncStatus: syncStatus,
    createdAt: createdAt,
    image: null, 
  );

  // Convert OfflineSms Entity to OfflineSmsModel
  static OfflineSmsModel fromEntity(OfflineSms sms) => OfflineSmsModel(
    id: sms.id,
    message: sms.message, 
    phoneNumber: sms.phoneNumber, // Add this line
    latitude: sms.latitude,
    longitude: sms.longitude,
    sentViaSms: sms.sentViaSms,
    syncStatus: sms.syncStatus,
    createdAt: sms.createdAt,
  );
}
